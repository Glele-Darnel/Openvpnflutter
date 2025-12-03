// main.dart
import 'package:flutter/material.dart';
import 'package:vpn/screen/Guest.dart';
import 'package:vpn/screen/guest/home.dart'; // Import corrigé avec majuscule

void main() {
  runApp(const BIRISVPN());
}

class BIRISVPN extends StatelessWidget {
  const BIRISVPN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BIRISVPN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      // Démarre avec le processus d'authentification
      home: const GuestScreen(),

      // Route vers l'écran principal après connexion
      routes: {
        '/home': (context) => const homeScreen(), // HomeScreen avec H majuscule
      },
    );
  }
}