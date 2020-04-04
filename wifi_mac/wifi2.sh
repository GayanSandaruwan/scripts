SSID_OF_NETWORK="ncpsp"								# fill wifi profile
WIRELESS_NETWORK_PASSPHRASE="113D112002@RACKID11X113"				# fill  wifi password		
password="District@dmin"										# fill admin password
INDEX_NUMBER="0"
SECURITY_OF_WIRELESS_NETWORK="WPA2"
WIRELESS_INTERFACE="en1"


echo $SSID_OF_NETWORK

# ln -s /System/Library/PrivateFrameworks/Apple80211.framework/
# Versions/Current/Resources/airport /Usr/bin/airport

echo $password | sudo -S networksetup -removepreferredwirelessnetwork $WIRELESS_INTERFACE $SSID_OF_NETWORK

echo $password | sudo -S networksetup -addpreferredwirelessnetworkatindex $WIRELESS_INTERFACE $SSID_OF_NETWORK $INDEX_NUMBER $SECURITY_OF_WIRELESS_NETWORK $WIRELESS_NETWORK_PASSPHRASE

echo $password | sudo -S networksetup -setairportnetwork $WIRELESS_INTERFACE $SSID_OF_WIRELESS_NETWORK $WIRELESS_NETWORK_PASSPHRASE
