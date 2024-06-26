#!/bin/bash

# showuptime() {
# 	up=$(uptime -p | cut -c4-)
# 	since=$(uptime -s)
#
# 	cat <<EOF
# ---
# This machine has been up for ${up}
# It has been running since ${since}
# ---
# EOF
# }
#
# showuptime
#

# Scope Example the above variables of up and since are not scopped to the function but instead are global
# local must be added before var declaration to scope it to the function

up=before
since=function
echo $up $since

showuptime() {
	local up=$(uptime -p | cut -c4-)
	local since=$(uptime -s)

	cat <<EOF
---
This machine has been up for ${up}
It has been running since ${since}
---
EOF
}

up=after

showuptime

echo $up $since
