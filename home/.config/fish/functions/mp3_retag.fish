# Defined in /tmp/fish.a9x420/mp3_retag.fish @ line 2
function mp3_retag --wraps=id3v2 --description 'renames input files by template {artist}-{trackanem}.{ext}'
	for file in $argv
		set Artist 	(id3v2 -l $file | grep TPE1 | cut -d ":" -f2 | sed -e 's/^[[:space:]]*//')
		set Title  	(id3v2 -l $file | grep TIT2 | cut -d ":" -f2 | sed -e 's/^[[:space:]]*//')
		set FileExt	(echo $file | sed 's/.*\.\(.*\)$/\1/')
		if test "$Artist" != "" ; and test "$Title" != ""
			mv -nv $file "$Artist - $Title.$FileExt"
		else
			echo "Skipped $file"
		end
	end
end
