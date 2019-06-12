set activeAppName to my getActiveApp()
set currentlyPlaying to my getCurrentlyPlaying()
set spotifyState to my getSpotifyState()

--check what media is playing and activates the player if it currently is not foremost,
--otherwise it executes an appropriate command like pausing or skipping

--Spotify has priority
if spotifyState is equal to "playing" then
	tell application "Spotify"
		if activeAppName = "Spotify" then
			tell application "Spotify" to next track
			return "spotify in foreground"
		end if
		activate
		return "spotify in background"
	end tell
end if

--Safari handler
if application "Safari" is running then
	tell application "Safari"
		repeat with w in windows
			repeat with t in tabs of w
				tell t
					if URL starts with "http://www.youtube.com/watch" or URL starts with "https://www.youtube.com/watch" or URL starts with "https://www.netflix.com/watch" then
						set activeTab to my getActiveSafariTab()
						if index of t is equal to activeTab and activeAppName = "Safari" then
							if URL starts with "https://www.netflix.com/watch" then
								set the URL to "https://www.netflix.com/browse"
								return "Netflix - homepage"
							else
								close t
							end if
						else
							set current tab of w to t
							activate
						end if
						return
					end if
				end tell
			end repeat
		end repeat
	end tell
end if


--use BTT's currently playing variable to check for players
if currentlyPlaying = "com.spotify.client" then
	tell application "Spotify"
		if activeAppName = "Spotify" then
			tell application "Spotify" to next track
			return "spotify in foreground"
		end if
		activate
		return "spotify in background"
	end tell
else if currentlyPlaying = "com.colliderli.iina" then
	if activeAppName = "IINA" then
		tell application "BetterTouchTool"
			trigger_named "pause"
		end tell
	else
		activate application "IINA"
	end if
	return "IINA in background"
else if currentlyPlaying = "com.apple.Safari" then
	tell application "BetterTouchTool"
		trigger_named "pause" -- this requires a named trigger with the play/pause action assigned
	end tell
	return "Safari in background"
end if

return "reached end"

if application "Spotify" is running then
	tell application "Spotify"
		if activeAppName = "Spotify" then
			playpause
		end if
		activate
	end tell
end if


--Spotify has priority
if spotifyState is equal to "playing" then
	tell application "Spotify"
		if activeAppName = "Spotify" then
			tell application "Spotify" to next track
			return "spotify in foreground"
		end if
		activate
		return "spotify in background"
	end tell
end if

-- Functions
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
