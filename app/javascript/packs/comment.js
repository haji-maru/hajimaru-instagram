import $ from "jquery";
import axios from "modules/axios";

document.addEventListener("DOMContentLoaded", () => {
  const post = $(".post-show");
  const postId = post.data("post-id"); // 投稿ごとの post_id を取得

  axios.get(`/posts/${postId}/comments`).then((response) => {
    const comments = response.data;
    comments.forEach((comment) => {
      $(".comment-container").append(`<p>${comment.content}</p>`);
    });
  });
});
