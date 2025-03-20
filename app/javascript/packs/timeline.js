import $ from "jquery";
import axios from "modules/axios";

const images_selection = () => {
  // 送信ボタン最初は非アクティブ
  $("#images-submit").prop("disabled", true).addClass("disabled");

  // ファイル選択画面ボタン
  $("#images-open").on("click", () => {
    $("#images-select").click();
  });

  // 画像の選択
  $("#images-select").on("change", (event) => {
    const fileInput = event.currentTarget;
    const previewContainer = $(".timeline-preview");
    previewContainer.empty(); // 既存のプレビューをクリア

    const files = fileInput.files;
    if (files.length > 0) {
      $.each(files, function (_, file) {
        if (file.type.startsWith("image/")) {
          const reader = new FileReader();
          reader.onload = (e) => {
            $("<img>", {
              src: e.target.result,
              class: "preview-image",
            }).appendTo(previewContainer);
          };
          reader.readAsDataURL(file);
        }
      });
    }
  });

  // 送信ボタンのクリック
  $("#images-submit").on("click", () => {
    $("#images-input").click();
  });
};

document.addEventListener("DOMContentLoaded", () => {
  images_selection();
});
