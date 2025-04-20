import $ from "jquery";
import axios from "modules/axios";

const handleHeartDisplay = (post, hasLiked) => {
  if (hasLiked) {
    post.find(".active-heart").removeClass("hidden");
  } else {
    post.find(".inactive-heart").removeClass("hidden");
  }
};

document.addEventListener("DOMContentLoaded", () => {
  $(".post-index").each(function () {
    const post = $(this); // 各投稿の要素
    const postId = post.data("post-id"); // 投稿ごとの post_id を取得

    axios.get(`/api/posts/${postId}/like`).then((response) => {
      const hasLiked = response.data.hasLiked;
      handleHeartDisplay(post, hasLiked);
    });

    // 「いいね」する処理
    post.find(".inactive-heart").on("click", () => {
      axios
        .post(`/api/posts/${postId}/like`)
        .then((response) => {
          if (response.data.status === "ok") {
            post.find(".active-heart").removeClass("hidden");
            post.find(".inactive-heart").addClass("hidden");
            post.find(".like-count").text(`いいね数 : ${response.data.like_count}`); // いいね数を更新
          }
        })

        .catch((e) => {
          window.alert("Error");
          console.log(e);
        });
    });

    // 「いいね」解除する処理
    post.find(".active-heart").on("click", () => {
      axios
        .delete(`/api/posts/${postId}/like`)
        .then((response) => {
          if (response.data.status === "ok") {
            post.find(".active-heart").addClass("hidden");
            post.find(".inactive-heart").removeClass("hidden");
            post.find(".like-count").text(`いいね数 : ${response.data.like_count}`); // いいね数を更新
          }
        })

        .catch((e) => {
          window.alert("Error");
          console.log(e);
        });
    });
  });
});
