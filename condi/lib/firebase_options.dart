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
        return macos;
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
    apiKey: 'AIzaSyAvky5g6YTMGQ7cbdLmFEypHEr3aN0kAXA',
    appId: '1:510545516428:web:ad28ff142ae4b25c6ee8a9',
    messagingSenderId: '510545516428',
    projectId: 'condi-523a0',
    authDomain: 'condi-523a0.firebaseapp.com',
    storageBucket: 'condi-523a0.appspot.com',
    measurementId: 'G-6VNJ9QRBN6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcMyV4dquQM96zAUrfQJosWDS-7jMe56U',
    appId: '1:510545516428:android:1008aa036a16db706ee8a9',
    messagingSenderId: '510545516428',
    projectId: 'condi-523a0',
    storageBucket: 'condi-523a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBh0R6oyknO9nFDAOPFVxheMPQXM0c6mc',
    appId: '1:510545516428:ios:d0d39fd3fb0350f96ee8a9',
    messagingSenderId: '510545516428',
    projectId: 'condi-523a0',
    storageBucket: 'condi-523a0.appspot.com',
    iosBundleId: 'com.example.condi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBh0R6oyknO9nFDAOPFVxheMPQXM0c6mc',
    appId: '1:510545516428:ios:24e842d48ec9342d6ee8a9',
    messagingSenderId: '510545516428',
    projectId: 'condi-523a0',
    storageBucket: 'condi-523a0.appspot.com',
    iosBundleId: 'com.example.condi.RunnerTests',
  );
}
