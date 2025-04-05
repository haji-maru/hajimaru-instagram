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
      const commentHtml = `
      <div class="post-comment-box">
        <div class="post-comment-avatar">
          <img src="${comment.user.profile.avatar_path}" />
        </div>
        <div class="post-comment-content">
          <div class="post-comment-username">
            <p>${comment.user.username}</p>
          </div>
          <div class="post-comment">
            <p>${comment.content}</p>
          </div>
        </div>
      </div>
    `;
      $(".post-comments").append(commentHtml);
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
      $("#comment_content")
        .val("")
        .catch((error) => {
          console.log(error.response.data);
        });
    }
  });
});
