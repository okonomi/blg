import hljs from 'highlight.js'

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
