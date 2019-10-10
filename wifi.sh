SSID_OF_NETWORK=${1}								# wifi profile
WIRELESS_NETWORK_PASSPHRASE=${2}					# wifi password		
INDEX_NUMBER="0"
SECURITY_OF_WIRELESS_NETWORK="WPA2"

echo $SSID_OF_NETWORK
ln -s /System/Library/PrivateFrameworks/Apple80211.framework/
Versions/Current/Resources/airport /Usr/bin/airport

networksetup -removepreferredwirelessnetwork en0 $SSID_OF_NETWORK

networksetup -addpreferredwirelessnetworkatindex en0 $SSID_OF_NETWORK $INDEX_NUMBER $SECURITY_OF_WIRELESS_NETWORK $WIRELESS_NETWORK_PASSPHRASE

networksetup -setairportnetwork en0 $SSID_OF_WIRELESS_NETWORK $WIRELESS_NETWORK_PASSPHRASE
