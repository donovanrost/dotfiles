// finicky config (https://github.com/johnste/finicky)
const defaultBrowser = 'Google Chrome'
const workUrls = ['hpm.agency', 'hpm.digital', 'hpm.guru', /.*\.hpm.land/, /.*\.hpm.agency$/]
const devUrls = ['github.com', 'gitlab.com', 'localhost']
const videoCalling = ['meet.jit.si']

const DEBUG = true
module.exports = {
  defaultBrowser,
  options: {
    hideIcon: false
  },
  handlers: [
    {
      match: ({ keys }) => keys.option && keys.command,
      browser: defaultBrowser === 'Google Chrome' ? 'Safari' : defaultBrowser
    },
    {
			// Open Spotify links in Spotify.app
      match: finicky.matchHostnames('open.spotify.com'),
      browser: 'Spotify'
    },
    {
      // Open zoom links directly in client
      match: /zoom.us\/j\//,
      browser: 'us.zoom.xos'
    },
    {
      // Open jitsi links directly in client
      match: ({ url }) => url.protocol === 'jitsi-meet',
      browser: 'org.jitsi.jitsi-meet'
    },
    {
      // Open in Chrome
      match: finicky.matchHostnames([...workUrls, ...videoCalling, ...devUrls, 'chrome.google.com']),
      browser: {
        name: 'Google Chrome',
        profile: 'Default' // ~/Library/Application Support/Google/Chrome folder names
      }
    },
    {
      match: ({ sourceBundleIdentifier }) => sourceBundleIdentifier === 'com.tinyspeck.slackmacgap' || sourceBundleIdentifier === 'Mattermost.Desktop',
      browser: defaultBrowser
    },
    {
      match: finicky.matchHostnames(['apple.com', /example\.(com|org|net)/]),
      browser: 'Safari'
    },
    {
      // Open youtube in safari
      match: finicky.matchHostnames(['youtube.com', 'youtube.de', /.*\.youtube.com/]),
      browser: 'Safari'
    }
  ],
  rewrite: [
    {
      match: ({ url }) => url.host.endsWith('hpm.guru'),
      url: ({ url }) => {
        const deeplink = 'jitsi-meet:/' + url.pathname
        finicky.log(deeplink)
        return deeplink
      }
    }
  ]
}

// finicky.notify();
// finicky.log();
