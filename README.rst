=======
release
=======

I work on a team and we maintain a bunch of services and decided to pull
the release script into a separate repo to make it easier to develop and
test.

If you don't work with me, it's unlikely this will be interesting to you.


Install
=======

To install, do this::

    install_into.sh DESTDIR

This will copy the ``release.py`` script into the DESTDIR and update the
``$SHA$`` so you know which version you installed.


Usage
=====

make-bug
--------

Create a deploy bug::

    $ release.py make-bug [--product PRODUCT] [--component COMPONENT]
 
This will generate a link for Mozilla's Bugzilla instance.

If you don't want to use that, that's fine. You can skip specifying the
product and component and instead copy/paste the summary and description.


make-tag
--------

Tags the repo for a deploy::

    $ release.py make-tag [--with-bug BUGID] [--with-tag TAG]

The bug id is free form, so it'll work with Mozilla's Bugzilla or GitHub
issues or whatever.

If you don't specify a tag, it'll figure one out.


History
=======

This is loosely based on a deploy-bug script I wrote and Peter's make-tag
script. I merged them together and rewrote some bits and that's what we've
got now.

Many thanks to Peter for his work on make-tag!
