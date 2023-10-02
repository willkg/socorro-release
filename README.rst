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


release.py
==========

Configure ``release.py`` in a few different ways:

1. A ``[tool.release]`` section in a ``pyproject.toml`` file in the current
   working directory. (If you're using Python <3.11, this requires the
   ``tomli`` library.)

   **OR**

   A ``[tool:release]`` section in a ``setup.cfg`` file in the current working
   directory.

2. Overridden by command-line arguments.

Keys:

``github_user``
   The GitHub user/organization for the project.

``github_project``
   The project name on GitHub.

``main_branch``
   The name of the main branch to compare against and tag.

``bugzilla_product`` (optional)
   The product for this project in Bugzilla. You only need to set this
   if you're going to call ``make-bug``.

``bugzilla_component`` (optional)
   The component for this project in Bugzilla. You only need to set this
   if you're going to call ``make-bug``.

``tag_name_template`` (optional)
   The template to use for building tag names. This uses datetime formatting
   tokens.

   Defaults to ``%Y.%m.%d``

   Note: If you're using ``setup.cfg``, you need to use ``%%`` so the ``%``
   doesn't get interpolated.


Example ``pyproject.toml`` for this project:

::

   [tool.release]
   github_user = "willkg"
   github_project = "socorro-release"
   main_branch = "main"
   tag_name_template = "%Y.%m.%d"


Example ``setup.cfg`` for this project:

::

   [tool:release]
   github_user = "willkg"
   github_project = "socorro-release"
   main_branch = "main"
   # Note that you have to double the % characters.
   tag_name_template = "%%Y.%%m.%%d"


**make-bug**

Create a deploy bug::

   $ release.py make-bug
 
This will generate a summary and description for a deploy bug. It also
generates a link to Mozilla's Bugzilla instance for creating the deploy bug. If
you don't want to use the link, that's fine--you can ignore it.


**make-tag**

Tags the repo for a deploy::

   $ release.py make-tag [--with-bug BUGID] [--with-tag TAG]

The bug id is free form, so it'll work with Mozilla's Bugzilla or GitHub
issues or whatever.

If you don't specify a tag, it'll figure one out.


service-status.py
=================

Configure ``service-status.py`` in a couple of different ways:

1. A ``[tool.service-status]`` section in a ``pyproject.toml`` file in the
   current working directory. (If you're using Python <3.11, this requires the
   ``tomli`` library.)

2. Overridden by command-line arguments.

Keys:

``main_branch``
   The name of the main branch in the git repository.

``hosts``
   A list of hosts which have a ``/__version__`` Dockerflow endpoint in the
   form of::

       ENVIRONMENTNAME=HOST

   For example::

       prod=https://crash-stats.mozilla.org


Example ``pyproject.toml``:

::

   [tool.service-status]
   main_branch = "main"
   hosts = [
       "stage=https://crash-stats.allizom.org",
       "prod=https://crash-stats.mozilla.org",
   ]


History
=======

``release.py`` is loosely based on a deploy-bug script I wrote and Peter's
make-tag script. I merged them together and rewrote some bits and that's what
we've got now.

Many thanks to Peter for his work on make-tag!

``service-status.py`` is a script I wrote that I use for multiple services.
