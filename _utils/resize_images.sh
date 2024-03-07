FILES="$@"
THRESHOLD_KB=512
for F in $FILES; do
  echo "Working on file $F"
  SIZE=$(du -k "$F" | cut -f1)
  echo "size: $SIZE KB"
  EXT=`echo $F | sed "s/.*\.\(.*\)$/\1/"`
  echo "ext: $EXT"
  F_RESIZED=$(echo $F | sed "s/\.$EXT/.r.$EXT/")
  RAW_F_RESIZED=$(echo $RAW_F | sed "s/\.$EXT/.r.$EXT/")
  if [ $SIZE -gt $THRESHOLD_KB ]; then
    echo "Image '$F' is larger than $THRESHOLD_KB KB"
    echo "Resizing..."
    convert "$F" -resize 50% -quality 75 "$F_RESIZED"
    F_RESIZED_SIZE=$(du -k "$F_RESIZED" | cut -f1)
    echo "Resized image size: $F_RESIZED_SIZE KB"
  fi
done
