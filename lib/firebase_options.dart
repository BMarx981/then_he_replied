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
    apiKey: 'AIzaSyAEfRpz8q5279oQrerne1ADjh3C2ZEVtOQ',
    appId: '1:194711819572:web:bcb4baf7e26d3fa0d60161',
    messagingSenderId: '194711819572',
    projectId: 'then-he-replied',
    authDomain: 'then-he-replied.firebaseapp.com',
    storageBucket: 'then-he-replied.appspot.com',
    measurementId: 'G-SHD9DWJFPS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYBqM0kkA6Mp2d4T7yc5tkpflONZzaO_k',
    appId: '1:194711819572:android:46bc5317d9f5cb79d60161',
    messagingSenderId: '194711819572',
    projectId: 'then-he-replied',
    storageBucket: 'then-he-replied.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrZOylSfE82rA8Abw_vx3y5xN9nrmQn7E',
    appId: '1:194711819572:ios:d3ea0923cc5b0a71d60161',
    messagingSenderId: '194711819572',
    projectId: 'then-he-replied',
    storageBucket: 'then-he-replied.appspot.com',
    iosBundleId: 'com.example.thenHeReplied',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBrZOylSfE82rA8Abw_vx3y5xN9nrmQn7E',
    appId: '1:194711819572:ios:d3ea0923cc5b0a71d60161',
    messagingSenderId: '194711819572',
    projectId: 'then-he-replied',
    storageBucket: 'then-he-replied.appspot.com',
    iosBundleId: 'com.example.thenHeReplied',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAEfRpz8q5279oQrerne1ADjh3C2ZEVtOQ',
    appId: '1:194711819572:web:f9a35658d70c420dd60161',
    messagingSenderId: '194711819572',
    projectId: 'then-he-replied',
    authDomain: 'then-he-replied.firebaseapp.com',
    storageBucket: 'then-he-replied.appspot.com',
    measurementId: 'G-P9J6KLK7WZ',
  );
}
