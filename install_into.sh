#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, you can obtain one at http://mozilla.org/MPL/2.0/.

# Install release.py into another project.

if [[ $# -eq 0 ]]; then
    echo "usage: install_into.sh DESTDIR"
    exit 1
fi

SHA=$(git rev-parse HEAD)
DEST=${1%/}

echo "Copying release.py ${SHA} to ${DEST}/release.py ..."
cat release.py | sed s/\\\$SHA\\\$/$SHA/ > "${DEST}/release.py"
