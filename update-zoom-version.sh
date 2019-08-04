#!/usr/bin/env bash

wget -O /tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
latestVersion=$(dpkg-deb -f /tmp/zoom.deb Version)
localVersion=$(cat ./ZOOM_VERSION)

if [ -z "$latestVersion" ]; then
	echo "Failed to retrieve latest version of Zoom."
	echo "Try again later or report an issue at: https://github.com/felicianotech/zoom-mgr/issues"
	exit 1
fi

if [ "$localVersion" = "$latestVersion" ]; then
	echo "The local Zoom version is current."
	exit
fi

echo $latestVersion > ./ZOOM_VERSION
