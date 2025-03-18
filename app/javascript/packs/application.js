// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import $ from "jquery";
import axios from "axios";
import { csrfToken } from "rails-ujs";

axios.defaults.headers.common["X-CSRF-Token"] = csrfToken(); // token発行 重要

const image_selection = () => {
  $("#avatar-preview").on("click", () => {
    $("#avatar-input").click();
  });

  $("#avatar-input").on("change", (event) => {
    const fileInput = event.currentTarget; // イベントの対象要素を取得
    if (fileInput.files && fileInput.files[0]) {
      // サブミットボタンをクリック
      $("#avatar-submit").click();
    }
  });
};

document.addEventListener("DOMContentLoaded", () => {
  image_selection();
});
