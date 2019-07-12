#/bin/sh

# https://nahuelhds.dev/slack/2018/11/22/Setup-Dark-Mode-in-Slack-on-MacOS.html

osascript -e 'quit app "Slack"'

FILE=/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
CSS_SOURCE=https://cdn.jsdelivr.net/gh/laCour/slack-night-mode@master/css/raw/black.css

cat >>$FILE <<EOL

document.addEventListener('DOMContentLoaded', function() {
    let tt__customCss = '.menu ul li a:not(.inline_menu_link) {color: #fff !important;}'
    $.ajax({
        url: '$CSS_SOURCE',
        success: function(css) {
            \$('<style></style>').appendTo('head').html(css + tt__customCss);
        }
   });
});
EOL
