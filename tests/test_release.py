# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

import pytest

import release


@pytest.mark.parametrize(
    "data, expected",
    [
        # No summary -> no bugs
        ("", []),
        # Single bug cases
        ("bug-111111: summary", ["111111"]),
        ("bug 111111: summary", ["111111"]),
        # Multi bug cases
        ("bug 111, 222: summary", ["111", "222"]),
        ("bug 111 & 222: summary", ["111", "222"]),
        ("bug 111, 222, 333: summary", ["111", "222", "333"]),
        ("bug 111, 222, & 333: summary", ["111", "222", "333"]),
        ("bug-111, bug-222, bug-333: summary", ["111", "222", "333"]),
    ],
)
def test_bug_finding(data, expected):
    assert release.find_bugs(data) == expected
