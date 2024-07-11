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
    apiKey: 'AIzaSyBH_nwPBtS6w0KMsLqL9v8VKivH32NGnWw',
    appId: '1:565811456922:web:ff527e0a80656b6a2de823',
    messagingSenderId: '565811456922',
    projectId: 'funciona-peru-61940',
    authDomain: 'funciona-peru-61940.firebaseapp.com',
    storageBucket: 'funciona-peru-61940.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnznI3d5XbLIIQpmK7aS2y-Tve3e6uapA',
    appId: '1:565811456922:android:7cd740a04b18ff572de823',
    messagingSenderId: '565811456922',
    projectId: 'funciona-peru-61940',
    storageBucket: 'funciona-peru-61940.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOCVGbtJWdoyBa_GLnOMChnqr3YKtZi9A',
    appId: '1:565811456922:ios:c417bb7183bc5b652de823',
    messagingSenderId: '565811456922',
    projectId: 'funciona-peru-61940',
    storageBucket: 'funciona-peru-61940.appspot.com',
    iosBundleId: 'com.example.funcionaPeru',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOCVGbtJWdoyBa_GLnOMChnqr3YKtZi9A',
    appId: '1:565811456922:ios:c417bb7183bc5b652de823',
    messagingSenderId: '565811456922',
    projectId: 'funciona-peru-61940',
    storageBucket: 'funciona-peru-61940.appspot.com',
    iosBundleId: 'com.example.funcionaPeru',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBH_nwPBtS6w0KMsLqL9v8VKivH32NGnWw',
    appId: '1:565811456922:web:f5ac88a26b7dc9f32de823',
    messagingSenderId: '565811456922',
    projectId: 'funciona-peru-61940',
    authDomain: 'funciona-peru-61940.firebaseapp.com',
    storageBucket: 'funciona-peru-61940.appspot.com',
  );
}