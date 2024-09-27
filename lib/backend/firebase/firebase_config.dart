import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBDZcvIeoeBk6Gbf6klOg8Fzb0b5ZRdlh8",
            authDomain: "todo-l3zymo.firebaseapp.com",
            projectId: "todo-l3zymo",
            storageBucket: "todo-l3zymo.appspot.com",
            messagingSenderId: "968766431716",
            appId: "1:968766431716:web:d202b2ed988df4bf1e27f1"));
  } else {
    await Firebase.initializeApp();
  }
}
