processvideo() {
  filenameRelative=$1
  filename="$PWD"/$filenameRelative
  encodedfilename="${filename%.MOV}.mp4"
  if [ ! -f $encodedfilename ]; then
    ffmpeg -i $filename -c:v libx264 -crf 23 -preset medium -pix_fmt yuvj420p -map 0:a:0 -map 0:v:0 -movflags +faststart $encodedfilename
    res=$?
    if [ $res -eq 0 ]; then
      newpath=$2
      filenameInNewPath=$newpath/$filenameRelative
      dirname=$(dirname "$filenameRelative")
      echo Moving file $filename to $filenameInNewPath
      mkdir -p $newpath/$dirname
      mv $filename $filenameInNewPath
    else
      rm $encodedfilename
      echo Removed $encodedfilename
    fi
  fi
}

export -f processvideo

path=$1
newpath=$2
echo $newpath
if [ "$newpath" == "" ]; then
	echo "usage: encode_all.sh path new_path_to_move_unencoded_files";
else
	find $path -name '*.MOV' \( -exec bash -c "processvideo {} $newpath" \; -o -print \)
fi

echo "Finished."
