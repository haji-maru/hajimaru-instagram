import $ from "jquery";
import axios from "modules/axios";

const images_selection = () => {
  $("#images-open").on("click", () => {
    $("#images-select").click();
  });

  $("#images-select").on("change", (event) => {
    const fileInput = event.currentTarget; // イベントの対象要素を取得
    if (fileInput.files && fileInput.files[0]) {
      // サブミットボタンをクリック
      $("#avatar-submit").click();
    }
  });
};

document.addEventListener("DOMContentLoaded", () => {
  images_selection();
});
