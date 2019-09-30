import hljs from 'highlight.js'
import 'highlight.js/styles/default.css'

document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('pre').forEach(block => {
    hljs.highlightBlock(block)
  })
})
