for f in _projects/*; do
  echo $f
  JPGS=$(cat $f | grep -o "\".*\.jpg.*\"" | xargs -I% echo ".%")
  for jpg in $JPGS; do
    png=$(echo $jpg | sed "s/jpg/png/")
    echo "converting '$jpg' to '$png'"
    magick "$jpg" -resize 50% "$png"
  done
  sed -i "s/jpg/png/g" "$f"
done
