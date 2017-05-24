filename="$1"
newfilename="${filename%.MOV}.mp4"
if [ ! -f $newfilename ]; then
  ffmpeg -i $filename -c:v libx264 -crf 23 -preset medium -pix_fmt yuvj420p -map 0:a:0 -map 0:v:0 -movflags +faststart $newfilename
fi
