// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCYy7XhGqtB_mSomQytu-Fq2C5x2TrcbPA',
    appId: '1:354949227098:web:b264a01cf6d8329c736e63',
    messagingSenderId: '354949227098',
    projectId: 'ultilytics',
    authDomain: 'ultilytics.firebaseapp.com',
    storageBucket: 'ultilytics.appspot.com',
    measurementId: 'G-ZX383757RF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaaBHglYwGY-9gTdDjgY5uNXiO2mTN1yw',
    appId: '1:354949227098:android:61655e6b1957f58c736e63',
    messagingSenderId: '354949227098',
    projectId: 'ultilytics',
    storageBucket: 'ultilytics.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBM_xTdtcrNfBa9gZ5v0v3JWxjksMH8Maw',
    appId: '1:354949227098:ios:27efa75bbfc7876c736e63',
    messagingSenderId: '354949227098',
    projectId: 'ultilytics',
    storageBucket: 'ultilytics.appspot.com',
    iosClientId: '354949227098-i2pnqn5aupeoedv1mg5pkcnu5riendqd.apps.googleusercontent.com',
    iosBundleId: 'com.example.ultilytics',
  );
}
