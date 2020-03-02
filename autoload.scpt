script vpn
	set targetApp to "Cisco AnyConnect Secure Mobility Client"
	
	-- Determine if AnyConnect is currently running
	tell application "System Events"
		set processExists to exists process targetApp
	end tell
	
	if processExists is true then
		tell application targetApp
			quit
		end tell
	else
		startCisco(targetApp)
	end if
	
	on startCisco(targetApp)
		tell application targetApp to activate
		tell application "System Events"
			repeat until (window 1 of process targetApp exists)
				delay 1
			end repeat
			tell process targetApp
				keystroke ("**Your VPN remote address**" as string)
				keystroke return
			end tell
			
			repeat until (window 2 of process targetApp exists)
				delay 1
			end repeat
			tell process targetApp
				delay 0.5
				set PWD to do shell script "**your password**"
				keystroke (PWD as text)
				keystroke return
			end tell
		end tell
	end startCisco
end script

run script vpn
