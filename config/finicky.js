module.exports = {
  defaultBrowser: 'Safari',
  options: {
    // Hide the finicky icon from the top bar
    hideIcon: true
  },
  handlers: [
    {
      // Open links in Safari when the option key is pressed
      // Valid keys are: shift, option, command, control, capsLock, and function.
      // Please note that control usually opens a tooltip menu instead of visiting a link
      match: ({ keys }) => keys.option,
      browser: 'Google Chrome'
    },
    // {
    //   // Open any link clicked in Slack in Safari
    //   match: ({ sourceBundleIdentifier }) =>
    //     sourceBundleIdentifier === 'com.tinyspeck.slackmacgap',
    //   browser: 'Google Chrome'
    // },
    {
      // Open work urls in Chrome
      match: finicky.matchHostnames(['hpm.agency', 'hpm.digital', /.*\.hpm.agency$/]),
      browser: 'Google Chrome'
    },
    {
      // Open work urls in Chrome
      match: finicky.matchHostnames(['zoom', 'zoom.us', /.*\.zoom.us$/]),
      browser: 'Google Chrome'
    },
    {
      // Open work urls in Chrome
      match: finicky.matchHostnames(['youtube.com', 'youtube.de', /.*\.youtube.com/]),
      browser: 'Safari'
    },
    // {
    //   // Avoid being rickrolled
    //   match: [
    //     'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
    //     'https://www.youtube.com/watch?v=oHg5SJYRHA0'
    //   ],
    //   url: 'about:blank'
    // },
    {
      match: ['http://example.com'],
      // Don't open any browser for this url, effectively blocking it
      browser: null
    }
  ]
}
