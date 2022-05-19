#!/bin/bash

# clear the input folders b4 the generate. Assumes that only sushi to writing to them!
# rm -f input/examples/*.json
# rm -f input/extensions/*.json
# rm -f input/profiles/*.json
# rm -f input/vocabulary/*.json



sushi  -s -o .

if [[ $? -eq 0 ]]
then

echo "Creating Profiles and extensions summary pages..."
../scripts/makeProfilesAndExtensions.js structuredpath
echo

echo "Making terminology summary"   # will copy into IG input folder
../scripts/makeTerminologySummary.js structuredpath

echo "Not doing anything else right now"

else 
echo
echo
echo "There were errors, so the other scripts weren't run..."
fi

