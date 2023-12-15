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
    apiKey: 'AIzaSyD7CaiizcdJ47U9CXPE1wJJ4WWzi-w1zMI',
    appId: '1:1059585759683:web:17a1c6bc28a541f54ec576',
    messagingSenderId: '1059585759683',
    projectId: 'resepminuman-c03a6',
    authDomain: 'resepminuman-c03a6.firebaseapp.com',
    databaseURL: 'https://resepminuman-c03a6-default-rtdb.firebaseio.com',
    storageBucket: 'resepminuman-c03a6.appspot.com',
    measurementId: 'G-X5EB4D303M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCETORVKLxxq8UGGwPkHaj0kKUPBA1ikbs',
    appId: '1:1059585759683:android:c837b448376e38d24ec576',
    messagingSenderId: '1059585759683',
    projectId: 'resepminuman-c03a6',
    databaseURL: 'https://resepminuman-c03a6-default-rtdb.firebaseio.com',
    storageBucket: 'resepminuman-c03a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOiu_sjb4ngn-BaNQwDSN_PgmevV4gDtQ',
    appId: '1:1059585759683:ios:afc0a0610f6ad0c04ec576',
    messagingSenderId: '1059585759683',
    projectId: 'resepminuman-c03a6',
    databaseURL: 'https://resepminuman-c03a6-default-rtdb.firebaseio.com',
    storageBucket: 'resepminuman-c03a6.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOiu_sjb4ngn-BaNQwDSN_PgmevV4gDtQ',
    appId: '1:1059585759683:ios:c569f53de6e45dc24ec576',
    messagingSenderId: '1059585759683',
    projectId: 'resepminuman-c03a6',
    databaseURL: 'https://resepminuman-c03a6-default-rtdb.firebaseio.com',
    storageBucket: 'resepminuman-c03a6.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}