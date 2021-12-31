// Entry point for the build script in your package.json
import "trix"
import "@rails/actiontext"
import Rails from "@rails/ujs"

import './src/bulma-navbar'
import './src/bulma-notification'
import './src/trix'
import './src/highlight'

Rails.start()
