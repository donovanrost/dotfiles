const workUrls = ['hpm.agency', 'hpm.digital', /.*\.hpm.agency$/]
const videoCalling = ['zoom', 'zoom.us', /.*\.zoom.us$/, 'meet.jit.si']
module.exports = {
  defaultBrowser: 'Safari',
  options: {
    // Hide the finicky icon from the top bar
    hideIcon: true
  },
  handlers: [
    {
      match: ({ keys }) => keys.option,
      browser: 'Google Chrome'
    },
    {
      // Open in Chrome
      match: finicky.matchHostnames([...workUrls, ...videoCalling, 'localhost', 'chrome.google.com']),
      browser: 'Google Chrome'
    },
    {
      // Open youtube in safari
      match: finicky.matchHostnames(['youtube.com', 'youtube.de', /.*\.youtube.com/]),
      browser: 'Safari'
    },
    {
      match: ({ sourceBundleIdentifier }) => sourceBundleIdentifier === 'com.tinyspeck.slackmacgap',
      browser: 'Google Chrome'
    }
  ]
}
