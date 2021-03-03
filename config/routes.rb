Rails.application.routes.draw do
  resources :pasts

  get "posts/index"         => "posts#index"
  get 'posts/new'           => "posts#new"
  get "posts/:id"           => "posts#show"
  get "posts/:id/past_mondai"=>"posts#past_mondai"
  get "posts/:id/note"      => "posts#note"
  get "posts/:id/handout"   => "posts#handout"
  get "posts/:id/task"      => "posts#task"
  get "posts/:id/another"   => "posts#another"
  post"posts/:id/create"    => "posts#create"
  post"posts/:id/evaluate"  => "posts#evaluate"
  post"posts/:id/like"      => "posts#like"
  post"posts/:id/bad"       => "posts#bad"

  get "subjects/new"        => "subjects#new"
  get "subjects/:id"        => "subjects#show"
  get "subjects/:id/edit"   => "subjects#edit"
  post "subjects/:id/create"=> "subjects#create"
  post 'subjects/create'    => "subjects#create"
  post "subjects/:id/update"=> "subjects#update"

  get "teachers/new"        => "teachers#new"
  get "teachers/:id"        => "teachers#show"
  get "teachers/:id/edit"   => "teachers#edit"
  post "teachers/:id/create"=> "teachers#create"
  post 'teachers/create'    => "teachers#create"
  post "teachers/:id/update"=> "teachers#update"

  get "courses/new"         => "courses#new"
  get "courses/:id"         => "courses#show"
  get "courses/:id/edit"    => "courses#edit"
  post 'courses/create'     => "courses#create"
  post "courses/:id/update" => "courses#update"

  get "users/index"         => "users#index"
  get "users/:id"           => "users#show"
  get "users/:id/edit"      => "users#edit"
  post "users/create"       => "users#create"
  post "users/search"       => "users#search"
  post "users/:id/update"   => "users#update"

  post "login"              => "users#login"
  post "logout"             => "users#logout"
  get "login"               => "users#login_form"
  get "signup"              => "users#new"

  get "/"                   => "home#top"
  get "about"               => "home#about"
  post "home/search"        => "home#search"

end
