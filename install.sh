##!/bin/bash
git submodule init
git submodule update

sed -i'' "/orgmode_config/"' s/^/;;/' "init.el"
