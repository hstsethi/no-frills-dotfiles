#!/bin/sh
## Date: 2023-05-13
## Author: HstSethi
## Usage: ./crop-sc-status-nav-bar.sh *.png # In my case mobile screenshots are in PNG rest in different

gm mogrify -gravity North -chop 0x50 -gravity South -chop 0x60  "$@"
