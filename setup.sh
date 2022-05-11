#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Org is required"
    exit 1
fi

if [[ -z "$2" ]]; then
    echo "Slug is required"
    exit 2
fi

if [[ -z "$3" ]]; then
    echo "Name is required"
    exit 3
fi

ORG="$1"
SLUG="$2"
NAME="$3"

TOKEN="flutter_base"

echo "Org:  $ORG"
echo "Slug: $SLUG"
echo "Name: $NAME"

echo "Renaming files..."

mv "./$TOKEN.iml" "./$SLUG.iml"
mv "./android/$TOKEN_android.iml" "./android/$SLUG_android.iml"

echo "Replacing tokens..."

FILES=`find . -type f | grep -v ".git" | grep -v "setup.sh"`

for file in $FILES; do
    sed -i "s/com\.$TOKEN/$ORG/g" $file
    sed -i "s/$TOKEN/$SLUG/g" $file
done

echo "Running pub get..."
flutter pub get

echo "Finished. You can delete this setup file now."
