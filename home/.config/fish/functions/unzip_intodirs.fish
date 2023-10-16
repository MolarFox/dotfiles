# Defined interactively
function unzip_intodir --wraps=unzip --description 'unzips input .zip files into their own directories'
	for zipfile in $argv 
		set fdir (basename $zipfile .zip)
		mkdir $fdir 
		unzip -d $fdir $zipfile
	end
end
