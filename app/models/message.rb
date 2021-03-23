class Message < ApplicationRecord
  validates :content, presence: true
  # createの後にコミットする { MessageBroadcastJobのperformを遅延実行 引数はself }
  after_create_commit { MessageBroadcastJob.perform_later self }
  has_many :notifications, dependent: :destroy

  belongs_to :user,optional: true
  belongs_to :room
end
