on adding folder items to theAttachedFolder after receiving theNewItems
	tell application "Finder"
		set all_files to every item of theNewItems as list
		repeat with index from 1 to the count of all_files
			set this_file to item index of all_files
			set this_file_name to name of (info for this_file)
			-- 쉘 스크립트 경로 수정 (/path/to/rename_utf8.sh)
			set new_file_name to do shell script "/path/to/rename_utf8.sh \"" & this_file_name & "\""
			if (this_file_name is not new_file_name) then
				if exists file (theAttachedFolder & new_file_name as string) then
					set i to 1
					repeat while i > 0
						set temp_file_name to i & "_" & new_file_name as string
						if exists file (theAttachedFolder & temp_file_name as string) then
							set i to i + 1
						else
							set the name of this_file to temp_file_name
							exit repeat
						end if
					end repeat
				else
					set the name of this_file to new_file_name
				end if
			end if
		end repeat
	end tell
end adding folder items to
