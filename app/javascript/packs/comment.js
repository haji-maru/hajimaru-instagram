import $ from "jquery";
import axios from "modules/axios";

document.addEventListener("DOMContentLoaded", () => {
  $(".show-comment-form").on("click", () => {
    $(".show-comment-form").addClass("hidden");
    $(".comment-area").removeClass("hidden");
  });

  const dataSet = $("#post-show").data();
  const postId = dataSet.postId;

  axios.get(`/posts/${postId}/comments`).then((response) => {
    const comments = response.data;
  });
});
