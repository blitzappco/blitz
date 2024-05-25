## Introduction
In addition to delivering the *.ipa and the *.apk files, we have taken the liberty to upload our application on TestFlight for iOS users. The juries could access the app [link](https://testflight.apple.com/join/us88QeCM).

If the jury cannot run the *.ipa or the *.apk files, we have built this guide to provide step-by-step instructions on how to build and run the frontend Flutter application. 

## Prerequisites

### General Requirements
- A computer running macOS, Linux, or Windows
- Internet connection
- Flutter SDK
- Android Studio (for Android) or Xcode (for iOS)
- A code editor (Visual Studio Code is recommended)
- A Google Maps API key which can be obtained from [here](https://developers.google.com/maps).

### Step 1: Install Flutter

1. Download the Flutter SDK from the [official Flutter website](https://flutter.dev/docs/get-started/install).
2. Follow the installation instructions for your operating system:
   - Windows
   - macOS
   - Linux

### Step 2: Set Up an Editor

1. Install Visual Studio Code from the [official website](https://code.visualstudio.com/).
2. Install the Flutter and Dart plugins for Visual Studio Code.

### Step 3: Set Up the Emulator

1. Install Android Studio from the [official website](https://developer.android.com/studio).
2. Follow the setup instructions to install the Android SDK and set up an emulator.
3. Alternatively, if you are on macOS and want to run the app on an iOS device, install Xcode from the App Store and set up an iOS simulator.

### Step 3.5: Stabilize install
At this point, we would advise to test the 
``` bash
flutter doctor
```
command to make sure that all required licenses and libraries have been installed.

### Step 4: Run the App
1. Navigate to application/lib/utils/env.dart, and provide a Google Maps API key. One may be obtained from [here](https://developers.google.com/maps).

2. Run the following command to get the dependencies.
``` bash
flutter pub get
```
3. Ensure that an emulator or a physical device is connected.
4. Run the app using the appropriate command.
``` bash
flutter run
```

## Troubleshooting
  - If you encounter issues with Flutter, check the official [Flutter documentation](https://flutter.dev/docs) or run `flutter doctor` to diagnose common problems.
