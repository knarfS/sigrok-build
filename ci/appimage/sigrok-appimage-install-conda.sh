#!/bin/sh
##
## This file is part of the sigrok-util project.
##
## Copyright (C) 2018-2023 Frank Stettner <frank-stettner@gmx.net>
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, see <http://www.gnu.org/licenses/>.
##

set -e
set -x

# We need the Python environment before the build already, therefore we have to run the conda
# plugin manually before the build
#wget https://github.com/linuxdeploy/linuxdeploy-plugin-conda/raw/master/linuxdeploy-plugin-conda.sh
wget https://github.com/knarfS/linuxdeploy-plugin-conda/raw/master/linuxdeploy-plugin-conda.sh

# Skip the built-in cleanup as the build needs the development files (headers, libs, ...)
export CONDA_SKIP_CLEANUP=1
export CONDA_SKIP_ADJUST_PATHS=1
chmod +x linuxdeploy-plugin-conda.sh
./linuxdeploy-plugin-conda.sh --appdir "$APP_DIR"

