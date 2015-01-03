#! /bin/sh

find 720p/ -name '*.xml' | while IFS=$'\n' read -r FILE; do
  echo "processing: $FILE"
  xsltproc -o temp.xml xbmc_label_pos.xslt "$FILE"
  mv temp.xml "$FILE"
done