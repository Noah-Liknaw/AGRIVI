import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:t_store/features/authentication/screens/addFarm/addfarm.dart';
import 'package:t_store/features/authentication/screens/login2/login_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(212, 50, 121, 20),
              ));
            }
            if (snapshot.hasData) {
              return const AddFarm();
            } else {
              return LoginScreen();
            }
          }),
    );
  }
}
