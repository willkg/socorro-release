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


Configuration
=============

Configure ``release.py`` by adding a ``[tool:release]`` section to the
``setup.cfg`` file in the current working directory.

Keys:

``github_user``
   The GitHub user/organization for the project.

``github_project``
   The project name on GitHub.

``bugzilla_product`` (optional)
   The product for this project in Bugzilla.

``bugzilla_component`` (optional)
   The component for this project in Bugzilla.


Example ``setup.cfg`` for this project:

::

   [tool:release]
   github_user = willkg
   github_project = socorro-release


Usage
=====

make-bug
--------

Create a deploy bug::

   $ release.py make-bug
 
This will generate a summary and description for a deploy bug. It also
generates a link to Mozilla's Bugzilla instance for creating the deploy bug. If
you don't want to use the link, that's fine--you can ignore it.


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
