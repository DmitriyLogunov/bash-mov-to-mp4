# MOV to MP4 converter script
Bash script to convert all MOV files in the given path to mp4 and then move MOV files to another path. Use case for this script is to re-encode videos from the digital camera in bulk.

# Usage

`./encode.sh <source-folder> <destination-folder>`

Script will look for MOV files in the source folder, run ffmpeg to convert them to mp4 xvid, and then move MOV files into destination folder, creating subfolders in it, following the structure of source.

e.g.:

`./encode.sh photos/2017 photos/mov`

# Known issues

* Source folder cannot be an absolute path or any path up in the tree from the current directory (i.e. having ../ in the path ). This is because script will not be able to create matching subfolder in the destination folder.
Workaround is to create a symlink in the current directory to the desired path and reference it instead of the real path.
