#!/bin/bash
# Prepares plugin for sale by compressing into a .zip file,
# moving it out to another folder on your local system,
# and pushing only the readme.txt file to GitHub so that it can be read by the EDD Software Licensing readme parser.
# Prerequisite: Main plugin file slug must be the same as the plugin folder name.
# Prerequisite: Existing git repo consising of only the readme.txt file (use .gitignore to hide the rest), with its remote origin set up on GitHub. GitHub repo name must match the plugin slug, exactly.
# Configure the 1st variable.

set -e

#config
READYFORSALE="${HOME}/readyforsale/" # destination folder for .zip file 

SLUG=${PWD##*/}

# Get version from main plugin file

CURRENTDIR=`pwd`
NEWVERSION=`grep "^Version" "$CURRENTDIR/${SLUG}.php" | awk -F' ' '{print $2}' | sed 's/[[:space:]]//g'`

if [[ -z "$NEWVERSION" ]]; then echo "ERROR: Cannot find version. Exiting early...."; exit 1; fi

echo "Zipping $SLUG version: $NEWVERSION"

cd ../

# zip the plugin
zip -r ${SLUG}.${NEWVERSION}.zip $SLUG -x '*tests*' '*.git*' '*.xml' '*.sh' '*~*'

echo "Moving the zipped plugin out to $READYFORSALE"

mv ${SLUG}.${NEWVERSION}.zip $READYFORSALE

echo "Pushing readme to GitHub..."

cd $SLUG
git add readme.txt
git commit -m "Updated changelog"
git push origin master

echo "*** FIN ***"
