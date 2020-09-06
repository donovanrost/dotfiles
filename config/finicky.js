const workUrls = ['hpm.agency', 'hpm.digital', /.*\.hpm.land/, /.*\.hpm.agency$/]
const videoCalling = ['meet.jit.si']
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
			// Open Spotify links in Spotify.app
			match: finicky.matchHostnames("open.spotify.com"),
			browser: "Spotify",
		},
    {
      match: /zoom.us\/j\//,
      browser: "us.zoom.xos"
    },
    {
      // Open in Chrome
      match: finicky.matchHostnames([...workUrls, ...videoCalling, 'localhost', 'chrome.google.com']),
      browser: {
        name: 'Google Chrome',
        profile: "Profile 1"
      }
    },
    {
      // Open youtube in safari
      match: finicky.matchHostnames(['youtube.com', 'youtube.de', /.*\.youtube.com/]),
      browser: 'Safari'
    },
    {
      match: ({ sourceBundleIdentifier }) => sourceBundleIdentifier === 'com.tinyspeck.slackmacgap',
      browser: {
        name: 'Google Chrome',
        profile: "Profile 1"
      }
    }
  ]
}
