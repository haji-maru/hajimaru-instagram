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
