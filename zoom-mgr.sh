#!/usr/bin/env bash

zoomMGRVersion="0.9.1"

install_zoom(){

	osID=$(grep -e "^ID=" /etc/os-release | cut -c4-)
	osCodename=$(grep -e "^UBUNTU_CODENAME=" /etc/os-release | cut -c17-)
	pkgs=""

	case $osCodename in
		bionic)
			pkgs="ibus libegl1-mesa libgl1-mesa-glx libxcb-xinerama0 libxcb-xtest0"
			;;
		focal)
			pkgs="ibus libegl1-mesa libgl1-mesa-glx libxcb-xinerama0 libxcb-xtest0"
			;;
		groovy)
			pkgs="ibus libegl1-mesa libgl1-mesa-glx libxcb-xinerama0 libxcb-xtest0"
			;;
		hirsute)
			pkgs="ibus libegl1-mesa libgl1-mesa-glx libxcb-xinerama0 libxcb-xtest0"
			;;
		*)
			echo "Your operating system is unsupported."
			exit 1
			;;
	esac

	wget -O /tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
	sudo apt-get update && sudo apt-get install -y $pkgs
	sudo dpkg -i /tmp/zoom.deb || (echo "Install failed, uninstalling the broken package..." && sudo apt-get purge zoom)
}

update_zoom(){
	if  ! dpkg -s zoom &> /dev/null; then
		echo "Can't perform an update, Zoom isn't installed."
		echo "Try running \`zoom-mgr install\` instead."
		exit 1
	fi

	localVersion=$(dpkg -s zoom | grep Version | cut -d " " -f 2)
	latestVersion=$(curl -s "https://raw.githubusercontent.com/felicianotech/zoom-mgr/master/ZOOM_VERSION")

	if [ -z "$latestVersion" ]; then
		echo "Failed to retrieve latest version of Zoom."
		echo "Try again later or report an issue at: https://github.com/felicianotech/zoom-mgr/issues"
		exit 1
	fi

	if [ "$localVersion" = "$latestVersion" ]; then
		echo "You are already using the latest version of Zoom."
	else
		echo "Zoom v${latestVersion} is available. Installing update."
		echo "If you are currently using Zoom, you'll need to restart after this update is complete."
		install_zoom
	fi
}

update_zoomMGR(){

	latestVersion=$(curl -s "https://raw.githubusercontent.com/felicianotech/zoom-mgr/master/VERSION")

	if [ -z "$latestVersion" ]; then
		echo "Failed to retrieve latest version of Zoom Manager."
		echo "Try again later or report an issue at: https://github.com/felicianotech/zoom-mgr/issues"
		exit 1
	fi

	if [ "$zoomMGRVersion" = "$latestVersion" ]; then
		echo "You are already using the latest version of Zoom Manager, skipping."
	else
		echo "Zoom Manager v${latestVersion} is available. Installing update."
		myPath=`dirname "$0"`
		myFilename=`basename "$0"`
		curl "https://raw.githubusercontent.com/felicianotech/zoom-mgr/master/zoom-mgr.sh" -o "${myPath}/${myFilename}"
	fi
}

action=$1

case $action in
	"--version")
		echo "zoom-mgr v${zoomMGRVersion}"
		;;
	install)
		if dpkg -s zoom &> /dev/null; then
			echo "Zoom is already installed."
			exit 1
		fi
		install_zoom
		;;
	update)
		update_zoomMGR
		update_zoom
		;;
	*)
		echo "Unsupported action."
		;;
esac
