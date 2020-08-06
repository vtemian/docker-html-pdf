#!/bin/sh

/opt/init &

python3 /opt/re-render.py "$HTML_TO_RENDER" "$OUTPUT_PDF"

inotifywait -q -m -e close_write,attrib --format %e "$HTML_TO_RENDER" |
while read events; do
    echo "###### Trigger re-render!"
    python3 /opt/re-render.py "$HTML_TO_RENDER" "$OUTPUT_PDF"
    echo "###### Done!"
done
