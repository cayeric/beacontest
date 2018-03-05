# beacontest
This app allowes transmitting of either iBeacon compatible or custom beacons.

## Installation
* Clone the repository
* In project file beacontest.xcodeproj: select "TARGETS/beacontest", select your iOS developer account for code signing in "general/signing"
* in AppDelegate, method "peripheralManagerDidUpdateState": comment out the proper part either for custom, or for iBeacon advertising
* run the test-App with attached iOS device

