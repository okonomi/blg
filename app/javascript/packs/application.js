// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("@rails/actiontext")

Rails.start()
// Turbolinks.start()
ActiveStorage.start()

import '@fortawesome/fontawesome-free/css/all.css'

import '../src/stylesheets/application'

import '../src/bulma-navbar'
import '../src/bulma-notification'
import '../src/trix'
import '../src/highlight'
