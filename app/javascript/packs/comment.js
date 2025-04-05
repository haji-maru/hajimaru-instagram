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

  $(".add-comment-button").on("click", () => {
    const content = $("#comment_content").val();
    // contentがなければ送信しない
    if (!content) {
      window.alert("コメントを入力してください");
    } else {
      axios
        .post(`/posts/${postId}/comments`, {
          comment: { content: content },
        })
        .then((response) => {
          const comment = response.data;
          $(`.post-comment[data-comment-id="${comment.id}"]`).append(`<p>${comment.content}</p>`);
        });
    }
  });
});
