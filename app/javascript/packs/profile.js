import $ from "jquery";
import axios from "axios";
import { csrfToken } from "rails-ujs";

axios.defaults.headers.common["X-CSRF-Token"] = csrfToken(); // token発行 重要

const image_selection = () => {
  $("#avatar-preview").on("click", () => {
    $("#avatar-input").click();
  });
};

document.addEventListener("DOMContentLoaded", () => {
  image_selection();
});
