// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bulma/css/bulma'
import '@fortawesome/fontawesome-free/css/all.css'
import '../src/bulma'

const Trix = require("trix")
require("@rails/actiontext")

Trix.config.textAttributes.inline_code = {
  tagName: 'code',
  inheritable: true
}

const defaultToolbarHTML = Trix.config.toolbar.getDefaultHTML()
Trix.config.toolbar.getDefaultHTML = () => (
  defaultToolbarHTML + '<button type="button" class="inline_code" data-trix-attribute="inline_code">inline_code</button>'
)
