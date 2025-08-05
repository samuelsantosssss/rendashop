import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCp8mGu2RJMBu4j5nvWmkd3u5J5Rdtco_g",
            authDomain: "renda-shop-sat8qr.firebaseapp.com",
            projectId: "renda-shop-sat8qr",
            storageBucket: "renda-shop-sat8qr.firebasestorage.app",
            messagingSenderId: "882293791001",
            appId: "1:882293791001:web:ca3ff2f89ee7623b8f8d88"));
  } else {
    await Firebase.initializeApp();
  }
}
