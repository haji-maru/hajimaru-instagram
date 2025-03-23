import $ from "jquery";
import axios from "modules/axios";

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
