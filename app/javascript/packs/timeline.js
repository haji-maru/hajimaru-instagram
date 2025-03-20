import $ from "jquery";
import axios from "modules/axios";

const images_selection = () => {
  $("#images-open").on("click", () => {
    $("#images-select").click();
  });

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

  $("#images-submit").on("click", () => {
    $("#images-input").click();
  });
};

document.addEventListener("DOMContentLoaded", () => {
  images_selection();
});
