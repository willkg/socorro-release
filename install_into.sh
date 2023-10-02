#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, you can obtain one at http://mozilla.org/MPL/2.0/.

# Install scripts into another project.

if [[ $# -eq 0 ]]; then
    echo "usage: install_into.sh DESTDIR"
    exit 1
fi

SHA=$(git rev-parse HEAD)
DEST=${1%/}

echo "Copying release.py ${SHA} to ${DEST}/release.py ..."
sed "s/\\\$SHA\\\$/$SHA/" < src/release.py > "${DEST}/release.py"

echo "Copying service-status.py ${SHA} to ${DEST}/service-status.py ..."
sed "s/\\\$SHA\\\$/$SHA/" < src/service-status.py > "${DEST}/service-status.py"
