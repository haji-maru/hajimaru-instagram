import $ from "jquery";
import axios from "modules/axios";

const handleFollowDisplay = (hasFollowed) => {
  if (hasFollowed) {
    $(".profile-follow").removeClass("hidden");
  } else {
    $(".profile-unfollow").removeClass("hidden");
  }
};

document.addEventListener("DOMContentLoaded", () => {
  const dataSet = $("#follow-show").data();
  const accountId = dataSet.accountId;

  // 初期表示のステータスを取得
  axios.get(`/api/account/${accountId}/follow`).then((response) => {
    const hasFollowed = response.data.hasFollowed; // ステータス取得
    handleFollowDisplay(hasFollowed);
  });

  // フォローする
  $(".profile-unfollow").on("click", () => {
    axios
      .post(`/api/account/${accountId}/follow`)
      .then((response) => {
        if (response.data.status === "ok") {
          $(".profile-follow").removeClass("hidden");
          $(".profile-unfollow").addClass("hidden");

          // フォロワーとフォローをカウント
          $(".follower-count").text(response.data.follower_count);
          $(".following-count").text(response.data.following_count);
        }
      })
      .catch((e) => {
        window.alert("Error");
        console.log(e);
      });
  });

  // フォロー外す
  $(".profile-follow").on("click", () => {
    axios
      .post(`/api/account/${accountId}/unfollow`)
      .then((response) => {
        if (response.data.status === "ok") {
          $(".profile-unfollow").removeClass("hidden");
          $(".profile-follow").addClass("hidden");

          // フォロワーとフォローをカウント
          $(".follower-count").text(response.data.follower_count);
          $(".following-count").text(response.data.following_count);
        }
      })
      .catch((e) => {
        window.alert("Error");
        console.log(e);
      });
  });
});
