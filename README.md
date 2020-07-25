# MOV to MP4 converter script
Bash script to convert all MOV files in the provided directory and subdirectories to mp4 and then move MOV files to another path. Use case for this script is to re-encode videos from the digital camera in bulk.

# Usage

`./encode.sh <source-folder> <destination-folder>`

Script will look for MOV files in the source folder, run ffmpeg to convert them to mp4 x264, and then move MOV files into destination folder, creating subfolders in it, following the structure of source.

e.g.:

`./encode.sh photos/2017 photos/mov`

# Known limitation

* Video source folder should be down the tree from the current directory (i.e. source cannot have ../ in the path ) and can't be an absolute path. This is because script will not be able to create matching subfolder in the destination folder.

Workaround is to run this script from any folder above, or from the video source folder, or create a symlink to the source path down the directory tree and reference it instead of the real path.
