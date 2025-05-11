// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

import Rails from "@rails/ujs";

axios.defaults.headers.common["X-CSRF-Token"] = Rails.csrfToken();
