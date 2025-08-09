#!/bin/bash
set -e

openwindows=$(osascript -e 'tell application "System Events" to get every window of (every process whose class of windows contains window)')
IFS=',' read -r -a windowslist <<< "$openwindows"

for window in "${windowslist[@]}"; do
    if [[ $window =~ "NotificationCenter" ]]; then
    echo -e "##vso[task.logissue type=warning] Opened notification center window found:\n$window"
    else
        echo "Found opened window:\n$window"
        scripterror=true
    fi
done

if [ "$scripterror" = true ]; then
    echo 'Opened windows found, test failed'
    exit 1
fi

echo 'Test passed'
