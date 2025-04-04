import $ from "jquery";
import axios from "modules/axios";

document.addEventListener("DOMContentLoaded", () => {
  // フォームの表示
  $(".show-comment-form").on("click", () => {
    $(".show-comment-form").addClass("hidden");
    $(".comment-area").removeClass("hidden");
  });

  const dataSet = $("#post-show").data();
  const postId = dataSet.postId;
  // comment_idに紐づくコメントを表示
  axios.get(`/posts/${postId}/comments`).then((response) => {
    const comments = response.data;
    comments.forEach((comment) => {
      $(`.post-comment[data-comment-id="${comment.id}"]`).append(`<p>${comment.content}</p>`);
    });
  });
});
