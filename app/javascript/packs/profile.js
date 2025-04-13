import $ from "jquery";
import axios from "modules/axios";

// 現在のアバター画像クリック
const image_selection = () => {
  $("#avatar-preview").on("click", () => {
    $("#avatar-input").click();
  });

  // 画像が選択された時の処理
  $("#avatar-input").on("change", (event) => {
    const fileInput = event.currentTarget; // <input type="file">を取得
    const file = fileInput.files[0]; // ユーザーが選んだファイル

    if (!file) return; // 何も選択しなかった場合に処理を止める

    const formData = new FormData(); //空のフォームを作成
    formData.append("profile[avatar]", file); // 選択した画像を入れる

    axios
      .put("/profile", formData) // put(url, data)必須
      .then((response) => {
        if (response.data.status === "ok") {
          // 新しい画像に差し替える
          $("#avatar-preview").attr("src", response.data.avatar_url);
        } else {
          alert("更新に失敗しました");
        }
      })
      .catch((error) => {
        alert("エラーが発生しました");
        console.error(error);
      });
  });
};

document.addEventListener("DOMContentLoaded", () => {
  image_selection();
});
