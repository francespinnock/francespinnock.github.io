PROJECT="$1"
EXTENSION="jpg"
THRESHOLD_KB=512
f="_projects/$PROJECT.md"
echo "Working on file: $f"
JPGFNS=$(grep -o '".*\.jpg\s*"'  $f)
echo $JPGFNS
for fn in $JPGFNS; do
  echo $fn | echo
done
for FN in $JPGFNS; do
  RAW_F=$(echo $FN | sed "s/\"//g" | xargs -I% echo "%")
  F=$(echo ".$RAW_F")
  echo "Image path in HTML: $RAW_F"
  echo "Relative path: $F"
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
    echo "Replacing image path in HTML..."
    sed -i "s!$RAW_F!$RAW_F_RESIZED!g" $f
  fi
done
