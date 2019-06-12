import Trix from 'trix'

Trix.config.textAttributes.inline_code = {
  tagName: 'code',
  inheritable: true
}

const defaultToolbarHTML = Trix.config.toolbar.getDefaultHTML()
Trix.config.toolbar.getDefaultHTML = () => (
  defaultToolbarHTML + '<button type="button" class="inline_code" data-trix-attribute="inline_code">inline_code</button>'
)
