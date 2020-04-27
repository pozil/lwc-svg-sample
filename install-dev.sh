#!/bin/bash

ORG_ALIAS="svg"
if [ "$#" -eq 1 ]; then
  ORG_ALIAS="$1"
fi

echo ""
echo "Installing org with alias: $ORG_ALIAS"
echo ""

echo "Creating scratch org..." && \
sfdx force:org:create -s -f config/project-scratch-def.json -d 30 -a $ORG_ALIAS && \
echo "" && \

echo "Pushing source..." && \
sfdx force:source:push -u $ORG_ALIAS && \
echo "" && \

echo "Opening sample app..." && \
sfdx force:org:open -u $ORG_ALIAS
EXIT_CODE="$?"

# Check exit code
echo ""
if [ "$EXIT_CODE" -eq 0 ]; then
    echo "Installation completed."
else
    echo "Installation failed."
fi
exit $EXIT_CODE
