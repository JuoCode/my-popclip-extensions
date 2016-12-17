set u to "{popclip text}"
set domain to do shell script "echo " & u & " | sed -e 's/.*:\\/\\/\\([^ !\\/]*\\)\\(.*\\)/\\1/' | sed -e 's/\\([^ ]\\)\\/.*/\\1/'"

tell application "iTerm"
	set win to current window
	if win is equal to missing value then
		set win to (create window with default profile)
		set sess to (current session of win)
		tell sess
      write text "ping " & domain
    end tell
	else
		set sess to (current session of win)
		tell sess
      write text "ping " & domain
    end tell
	end if
end tell