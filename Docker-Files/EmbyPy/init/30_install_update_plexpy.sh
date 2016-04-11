#!/bin/bash
chown -R abc:abc /config

#If variable $ADVANCED_GIT_BRANCH, set branch to $ADVANCED_GIT_BRANCH, otherwise, default to master
[ "$ADVANCED_GIT_BRANCH" ] && \
echo "BRANCH: $ADVANCED_GIT_BRANCH, Warning! This is unsupported." || ADVANCED_GIT_BRANCH="master"

[[ ! -d /opt/embypy/.git ]] && (echo "Cloning $ADVANCED_GIT_BRANCH branch..." && \
git clone https://github.com/Meta-Man/EmbyPy.git --branch $ADVANCED_GIT_BRANCH /opt/embypy && \
chown -R abc:abc /opt/embypy/)

# opt out for autoupdates
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0
cd /opt/plexpy
git pull
chown -R abc:abc /opt/embypy/