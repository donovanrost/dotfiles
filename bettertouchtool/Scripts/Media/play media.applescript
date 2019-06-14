set activeAppName to my getActiveApp()
set currentlyPlaying to my getCurrentlyPlaying()
set spotifyState to my getSpotifyState()

--uncomment this to get the bundle identifier of the currently playing app
--return currentlyPlaying
--return spotifyState

if spotifyState = "playing"
	tell application "Spotify" to playpause
	return "Spotify paused"
end if
--handle foreground app
if activeAppName = "Spotify" then
	tell application "Spotify"
		playpause
		return "Spotify in foreground"
	end tell

else if activeAppName = "IINA" then
	tell application "System Events"
		key code 49 -- space bar
		return "IINA in foreground"
	end tell

else if activeAppName = "Kodi" then
	if spotifyState is equal to "playing" then
		tell application "Spotify" to playpause
	end if
	tell application "System Events"
		key code 49 -- space bar
		return "Kodi in foreground"
	end tell

	-- Safari handling
else if application "Safari" is running then
	tell application "Safari"
		set activeTab to my getActiveSafariTab()
		repeat with w in windows
			repeat with t in tabs of w
				tell t
					--Netflix
					if URL starts with "https://www.netflix.com/watch" then
						--pause other players
						if spotifyState is equal to "playing" then
							tell application "Spotify" to playpause
						end if
						do JavaScript "var v = document.querySelector('video');
								if (v.paused) {
								  v.play();
								}
								else {
								  v.pause();
								}"
						--Alternative:
						--do JavaScript " document.getElementsByClassName('PlayerControlsNeo__button-control-row')[0].getElementsByTagName('button')[0].click()"
						return "Netflix"
						--YouTube
					else if URL starts with "http://www.youtube.com/watch" or URL starts with "https://www.youtube.com/watch" then
						if activeTab = index of t then --YouTube Player is open
							if activeAppName = "Safari" then
								--pause other players
								if spotifyState is equal to "playing" then
									tell application "Spotify" to playpause
								end if
								do JavaScript "document.getElementsByClassName('ytp-play-button ytp-button')[0].click();"
								--tell application "System Events"
								--key code 49 -- space bar
								--end tell
								return "YouTube in foreground"
							end if
						else
							do JavaScript "document.getElementsByClassName('ytp-play-button ytp-button')[0].click();"
							return "YouTube in background"
						end if
					end if
				end tell
			end repeat
		end repeat
	end tell
end if

--handle background playing
if currentlyPlaying = "com.spotify.client" then
	if application "Spotify" is running then
		tell application "Spotify" to playpause
		return "Spotify in background"
	end if
else if currentlyPlaying = "com.apple.Safari" then
	tell application "BetterTouchTool"
		trigger_named "pause" -- this requires a named trigger with the play/pause action assigned
	end tell
	return "Safari in background"
end if

tell application "BetterTouchTool"
	trigger_named "pause" -- this requires a named trigger with the play/pause action assigned
end tell
--tell application "Spotify" to playpause
return "reached end"

--add your own media app by replacing bundle.identifier
if currentlyPlaying = "bundle.identifier" then
	tell application "BetterTouchTool"
		trigger_named "pause" -- this requires a named trigger with the play/pause action assigned
	end tell
--end if

else if currentlyPlaying = "com.colliderli.iina" then
	tell application "BetterTouchTool"
		trigger_named "pause"
	end tell
	return "IINA in background"

else if currentlyPlaying = "com.apple.Safari" then
	tell application "BetterTouchTool"
		trigger_named "pause" -- this requires a named trigger with the play/pause action assigned
	end tell
	return "Safari in background"
end if

-- Functions

-- Return the active app as a String
on getActiveApp()
	tell application "System Events" to set activeApp to first process where it is frontmost
	return name of activeApp
end getActiveApp

-- Return the index of the current tab in Safari's frontmost window
on getActiveSafariTab()
	tell application "Safari" to return index of current tab of front window
end getActiveSafariTab

-- Return the the bundle identifier of the currently playing app, as determined by BTT
on getCurrentlyPlaying()
	tell application "BetterTouchTool" to return get_string_variable "BTTCurrentlyPlayingApp"
end getCurrentlyPlaying

-- Return the player state of spotify (playing or paused)
on getSpotifyState()
	if application "Spotify" is running then
		tell application "Spotify" to return player state as text
	end if
	return "not running"
end getSpotifyState

on isOtherPlayerRunning()
	set currentPlayer to my getCurrentlyPlaying()
end isOtherPlayerRunning


--else if activeAppName = "iTunes" then
--	if spotifyState is equal to "playing" then
--		tell application "Spotify" to playpause
--	end if
--	tell application "iTunes"
--		playpause
--		return "iTunes in foreground"
--	end tell
