import $ from "jquery";
import axios from "modules/axios";

// 送信ボタン最初は非アクティブ
const disableSubmitButton = () => {
  $("#images-submit").prop("disabled", true).addClass("disabled");
};

// ファイル選択画面ボタン
const setupImageSelector = () => {
  $("#images-open").on("click", () => {
    $("#images-select").click();
  });
};

const checkFormStatus = () => {
  const hasContent = $("#content").val().trim().length > 0; // 入力があるか
  const hasImages = $("#images-select")[0].files.length > 0 || $(".post-preview img").length > 0;
  // 画像が選択かプレビューに画像ありの場合

  if (hasContent && hasImages) {
    $("#images-submit").prop("disabled", false).removeClass("disabled");
  } else {
    $("#images-submit").prop("disabled", true).addClass("disabled");
  }
};

const images_selection = () => {
  // 画像の選択
  $("#images-select").on("change", (event) => {
    const previewContainer = $(".post-preview").empty(); // プレビューをクリア
    Array.from(event.target.files).forEach((file) => {
      if (file.type.startsWith("image/")) {
        const reader = new FileReader();
        reader.onload = (e) =>
          $("<img>", { src: e.target.result, class: "preview-image" }).appendTo(previewContainer);
        reader.readAsDataURL(file);
      }
    });
    checkFormStatus(); // 画像選択後にフォームの状態を確認
  });

  // テキスト入力の変更を監視
  $("#content").on("keyup", checkFormStatus);

  // 送信ボタンのクリック
  $("#images-submit").on("click", () => {
    $("#images-input").click();
  });
};

document.addEventListener("DOMContentLoaded", () => {
  disableSubmitButton();
  setupImageSelector();
  images_selection();
});
