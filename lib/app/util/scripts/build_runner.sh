flutter packages pub run build_runner build --delete-conflicting-outputs


flutter clean 
 flutter pub get 
 cd ios
 pod install  --repo-update
cd ..
flutter build ipa

flutter clean && flutter build appbundle --release --obfuscate --split-debug-info=build/debug-info/

flutter build appbundle --release
flutter build apk --release


ekle android url launcher
<!-- Provide required visibility configuration for API level 30 and above -->
<queries>
  <!-- If your app checks for SMS support -->
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="sms" />
  </intent>
  <!-- If your app checks for call support -->
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="tel" />
  </intent>
  <!-- If your application checks for inAppBrowserView launch mode support -->
  <intent>
    <action android:name="android.support.customtabs.action.CustomTabsService" />
  </intent>
</queries>