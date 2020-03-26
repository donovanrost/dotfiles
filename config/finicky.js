module.exports = {
  defaultBrowser: 'Safari',
  options: {
    // Hide the finicky icon from the top bar
    hideIcon: false
  },
  handlers: [
    {
      match: ({ sourceBundleIdentifier }) =>
        sourceBundleIdentifier === 'com.tinyspeck.slackmacgap',
      browser: 'Google Chrome'
    },
    {
      match: ['http://hpm.agency'],
      browser: {
        name: 'Google Chrome',
        // Force opening the link in the background
        openInBackground: true
      }
    },
    {
      match: ['http://example.com'],
      // Don't open any browser for this url, effectively blocking it
      browser: null
    }
  ]
}
