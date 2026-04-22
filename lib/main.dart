import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:never_have_iever_game/Ready%20to%20Play.dart' hide Settings;
import 'package:never_have_iever_game/t_text.dart';
import 'package:never_have_iever_game/your_friends.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';

/// ================= MAIN =================
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // ✅ AUTO ANONYMOUS SIGNUP BEFORE APP START
  await AuthService.signInAnonymously();

  runApp(ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: const MyApp(),
    ));
}

/// ================= AUTH SERVICE =================
class AuthService {
  static Future<void> signInAnonymously() async {
    final auth = FirebaseAuth.instance;

    // ✅ already logged in → do nothing
    if (auth.currentUser != null) return;

    // ✅ anonymous login
    UserCredential credential = await auth.signInAnonymously();

    String uid = credential.user!.uid;

    // ✅ create firestore user document
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      "uid": uid,
      "unlockedLevel": 1,
      "createdAt": FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}

/// ================= APP =================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// ✅ AUTO LOGIN LISTENER
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // ✅ USER EXISTS → GO GAME
          if (snapshot.hasData) {
            return Get_Friends();
          }

          // fallback (rare case)
          return const Scaffold(
            body: Center(child: Text("Creating Player...")),
          );
        },
      ),
    );
  }
}
