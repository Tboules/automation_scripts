#!/bin/bash

# if elif else version

# if [ ${1,,} = tony ]; then
# 	echo "welcome, $1 enter here as you like"
# elif [ ${1,,} = help ]; then
# 	echo "Please don't be dumb, enter your username"
# else
# 	echo "who do you think you are?"
# fi

# Case Statement version

case ${1,,} in
tony | admin)
	echo "welcome $1, enter as you like"
	;;
help)
	echo "Please don't be dumb, enter a username"
	;;
*)
	echo "Who in the heck do you think you are?"
	;;
esac
