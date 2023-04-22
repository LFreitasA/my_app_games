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
    apiKey: 'AIzaSyBvxNsgVixjtqjSAq-ZO9mY9GHPiGwrdI4',
    appId: '1:140447045718:web:7a13cc1edf930054ab43f7',
    messagingSenderId: '140447045718',
    projectId: 'my-app-games',
    authDomain: 'my-app-games.firebaseapp.com',
    storageBucket: 'my-app-games.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDP5qlSkzv96t6mOGX3knqqnAi_g2ijQg4',
    appId: '1:140447045718:android:9dcace021b246b0dab43f7',
    messagingSenderId: '140447045718',
    projectId: 'my-app-games',
    storageBucket: 'my-app-games.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDudA7-40tBNXCF0lwZiRmtjyKNo4uNRes',
    appId: '1:140447045718:ios:4e96e192af786d2eab43f7',
    messagingSenderId: '140447045718',
    projectId: 'my-app-games',
    storageBucket: 'my-app-games.appspot.com',
    iosClientId: '140447045718-6i6e7jjtmn9e0l5quispua849988fhkv.apps.googleusercontent.com',
    iosBundleId: 'com.example.myGames',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDudA7-40tBNXCF0lwZiRmtjyKNo4uNRes',
    appId: '1:140447045718:ios:4e96e192af786d2eab43f7',
    messagingSenderId: '140447045718',
    projectId: 'my-app-games',
    storageBucket: 'my-app-games.appspot.com',
    iosClientId: '140447045718-6i6e7jjtmn9e0l5quispua849988fhkv.apps.googleusercontent.com',
    iosBundleId: 'com.example.myGames',
  );
}