import $ from "jquery";
import axios from "modules/axios";

document.addEventListener("DOMContentLoaded", () => {
  const dataSet = $("#follow-show").data();
  const accountId = dataSet.accountId;

  axios.get(`/accounts/${accountId}/follow`).then((response) => {
    console.log(response);
  });
});
