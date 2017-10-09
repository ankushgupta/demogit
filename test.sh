#!/bin/sh

git checkout develop

# retrieve branch name
BRANCH_NAME=$(git branch | sed -n '/\* /s///p')

# remove prefix release
REGEXP_RELEASE="develop\/"
VERSION_BRANCH=$(echo "$BRANCH_NAME" | sed "s/$REGEXP_RELEASE//") 

echo "Current version branch is $VERSION_BRANCH"

# retrieve the last commit on the branch
VERSION=$(git describe --tags  --abbrev=0)

# split into array
VERSION_BITS=(${VERSION//./ })

#get number parts and increase last one by 1
VNUM1=${VERSION_BITS[0]}
VNUM2=${VERSION_BITS[1]}
VNUM2=$((VNUM2+1))

#create new tag
NEW_TAG="$VNUM1.$VNUM2.$VNUM3"

echo "Updating $VERSION to $NEW_TAG"

