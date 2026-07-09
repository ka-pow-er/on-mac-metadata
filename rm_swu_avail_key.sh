#!/bin/sh
PLIST=/var/db/.com.YOUR-ORG.host-info.plist
if  [ -e "$PLIST" ]; then
	echo "plist found"
fi
KEY="swu_avail"
KEY_TEST="defaults read $PLIST $KEY"
if ($KEY_TEST) > /dev/null 2>&1; then
	echo "swu date stamp found. removing"
	/usr/libexec/PlistBuddy -c 'Delete :swu_avail' $PLIST
fi
/usr/local/jamf/bin/jamf recon
exit 0
