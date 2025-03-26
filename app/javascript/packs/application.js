// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

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

    axios.get(`/posts/${postId}/like`).then((response) => {
      const hasLiked = response.data.hasLiked;
      handleHeartDisplay(post, hasLiked);
    });

    // 「いいね」する処理
    post.find(".inactive-heart").on("click", () => {
      axios
        .post(`/posts/${postId}/like`)
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
        .delete(`/posts/${postId}/like`)
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
