import 'package:Opchoo/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/authenticate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Opchoo());
}

class Opchoo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticateProvider>(
          create: (_) => AuthenticateProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticateProvider>().authstate,
        ),
      ],
      child: MaterialApp(
        title: "IntaTask",
        debugShowCheckedModeBanner: false,
        home: Authenticate(),
      ),
    );
  }
}
