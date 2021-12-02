#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, you can obtain one at http://mozilla.org/MPL/2.0/.

# Usage: bin/lint.sh [--fix]
#
# Runs linting and code fixing.

set -euo pipefail

BLACKARGS=("--line-length=88" "--target-version=py36")
FILES=(release.py)

echo ">>> versions of things"
echo "python: $(python --version)"
echo "flake8: $(flake8 --version)"
echo "black: $(black --version)"

if [[ "${1:-}" == "--fix" ]]; then
    echo ">>> black fix"
    black "${BLACKARGS[@]}" "${FILES[@]}"

else
    echo ">>> flake8"
    flake8 "${FILES[@]}"

    echo ">>> black"
    black --check "${BLACKARGS[@]}" "${FILES[@]}"
fi
