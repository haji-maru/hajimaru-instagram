import $ from "jquery";
import axios from "modules/axios";

document.addEventListener("DOMContentLoaded", () => {
  const dataSet = $("#follow-show").data();
  const accountId = dataSet.accountId;

  axios.get(`/accounts/${accountId}/follow`).then((response) => {
    const hasFollowed = response.data.hasFollowed; // ステータス取得
    if (hasFollowed) {
      $(".profile-follow").removeClass("hidden");
    } else {
      $(".profile-unfollow").removeClass("hidden");
    }
  });
});
