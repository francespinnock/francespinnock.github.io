for f in _projects/*; do
  echo $f
  sed -i "" "s/png/jpg/g" "$f"
done
