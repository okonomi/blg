import hljs from 'highlight.js'
import 'highlight.js/styles/default.css'

hljs.configure({
  languages: [
    'shell',
    'ruby',
    'html',
    'yaml',
    'dockerfile'
  ]
})

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('pre').forEach(block => {
    hljs.highlightBlock(block)
  })
})
