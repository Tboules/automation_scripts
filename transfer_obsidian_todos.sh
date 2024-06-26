#!/usr/bin/env bash

DATE_FORMAT="%Y-%m-%d"

TODAY=$(date +$DATE_FORMAT)
YESTERDAY=$(date -d "yesterday" +$DATE_FORMAT)

TODAY_PATH=$(find $HOME/Documents/vault/gnosis/Calendar -name $TODAY*)
YESTERDAY_PATH=$(find $HOME/Documents/vault/gnosis/Calendar -name $YESTERDAY*)

awk '/## Tasks/,/## Notes/' $YESTERDAY_PATH | grep "\- \[ \]" | while read -r line; do
	sed -i "/## Tasks/a $line" "$TODAY_PATH"
done

sed -i "/- \[ \] Start your todos/d" "$TODAY_PATH"

echo "You todos have been moved over :)"
