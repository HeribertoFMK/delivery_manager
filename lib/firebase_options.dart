// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
  apiKey: "AIzaSyAQ2XdPM-sZvtM1ZvppmYIk_3dY6_rRr5g",
  authDomain: "delivery-manager-man.firebaseapp.com",
  projectId: "delivery-manager-man",
  storageBucket: "delivery-manager-man.firebasestorage.app",
  messagingSenderId: "298055092830",
  appId: "1:298055092830:web:554bc3e20d6a9a181102cf",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-Ap-bir86yp1tYwaiptPdLSSG4CwUwFY',
    appId: '1:298055092830:android:3bf4d58ca3e2b5311102cf',
    messagingSenderId: '298055092830',
    projectId: 'delivery-manager-man',
    storageBucket: 'delivery-manager-man.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdkv1QcF1dXYNdnafoBRSw5waigzTE1M4',
    appId: '1:298055092830:ios:67ec928f02b2cef81102cf',
    messagingSenderId: '298055092830',
    projectId: 'delivery-manager-man',
    storageBucket: 'delivery-manager-man.firebasestorage.app',
    iosBundleId: 'com.example.testeFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAdkv1QcF1dXYNdnafoBRSw5waigzTE1M4',
    appId: '1:298055092830:ios:67ec928f02b2cef81102cf',
    messagingSenderId: '298055092830',
    projectId: 'delivery-manager-man',
    storageBucket: 'delivery-manager-man.firebasestorage.app',
    iosBundleId: 'com.example.testeFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAQ2XdPM-sZvtM1ZvppmYIk_3dY6_rRr5g',
    appId: '1:298055092830:web:0801213efd7c061f1102cf',
    messagingSenderId: '298055092830',
    projectId: 'delivery-manager-man',
    authDomain: 'delivery-manager-man.firebaseapp.com',
    storageBucket: 'delivery-manager-man.firebasestorage.app',
  );
}
