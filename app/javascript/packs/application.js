// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
//=require bootstrap
Rails.start()
ActiveStorage.start()
//= require_tree .
//= require jquery
//= require jquery_ujs

$(function() {
    $('.sslick').slick({
        dots: false,
        //autoplay: true,
        //autoplaySpeed: 1000,
        swipe:true
    });
});
