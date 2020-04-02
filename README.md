# Zoom Manager (`zoom-mgr`) [![CircleCI Build Status](https://circleci.com/gh/felicianotech/zoom-mgr.svg?style=shield)](https://circleci.com/gh/felicianotech/zoom-mgr) [![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/felicianotech/zoom-mgr/master/LICENSE)

`zoom-mgr` is a script that makes installing and updating the Zoom video 
conferencing software on Ubuntu easier.


## Requirements

This project supports 64-bit desktop installations of Ubuntu 18.04 "Bionic" 
and Ubuntu 19.04 "Disco".
For 32-bit support or other distros, please open a Pull Request or Issue.


## Installation

`zoom-mgr` is a Bash script that can be run from anywhere in your home 
directory.
Here's a typical install:

```
cd ~
curl -O https://raw.githubusercontent.com/felicianotech/zoom-mgr/master/zoom-mgr.sh
chmod +x ~/zoom-mgr.sh
```


## Usage

```
~/zoom-mgr.sh install
```

Installs the Zoom Linux Client on your machine.

```
~/zoom-mgr.sh update
```

If a newer version of Zoom is available, download and install it.


## Updating Zoom Manager

At the moment there isn't any separate update command. To update Zoom Manager itself (not Zoom), just re-install it with the same instructions from the "Installation" section above. The `chmod` line won't be needed for the upgrade.


## Development

Instructions coming in the future.


## License

The source code for `zoom-mgr` is licensed under the MIT license.
This repo's license can be found [here](./LICENSE).
Zoom itself is a proprietary product by [Zoom Video Communications, Inc](https://zoom.us/).
This project is not affiliated with nor endorsed by them.
