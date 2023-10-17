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
    apiKey: 'AIzaSyDWXby8O7x9m9bKs1k08I9v6MPx0FaTRxA',
    appId: '1:452881834159:web:f86932952d1f465257b45a',
    messagingSenderId: '452881834159',
    projectId: 'map-beauty-f8b01',
    authDomain: 'map-beauty-f8b01.firebaseapp.com',
    storageBucket: 'map-beauty-f8b01.appspot.com',
    measurementId: 'G-ZHPBKQQQ04',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLVs5nyorGP-5CBuFe0obCySWm_B1w31Y',
    appId: '1:452881834159:android:063966fabe03889b57b45a',
    messagingSenderId: '452881834159',
    projectId: 'map-beauty-f8b01',
    storageBucket: 'map-beauty-f8b01.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtATQezLGAlV7rtzmrVjHe0irOCY3iiok',
    appId: '1:452881834159:ios:ff79a9a6aaa0b90f57b45a',
    messagingSenderId: '452881834159',
    projectId: 'map-beauty-f8b01',
    storageBucket: 'map-beauty-f8b01.appspot.com',
    iosBundleId: 'br.com.mapbeauty.app',
  );
}
