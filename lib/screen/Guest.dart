import 'package:flutter/material.dart';
import 'package:vpn/screen/guest/Auth.dart';
import 'package:vpn/screen/guest/Password.dart';
import 'package:vpn/screen/guest/Term.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  late List<Widget> _widgets;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _widgets = [
      // Étape 0 : Saisie de l'email
      AuthScreen(
        onChangedStep: _changeStep,
      ),

      // Étape 1 : Conditions Générales d'Utilisation
      TermScreen(
        onChangedStep: _changeStep,
      ),

      // Étape 2 : Mot de passe
      PasswordScreen(
        onChangedStep: _changeStep,
      ),
    ];
  }

  // Fonction appelée par chaque écran pour changer d'étape
  void _changeStep(int newIndex) {
    if (newIndex >= _widgets.length) {
      // Fin du flux d'authentification → on va à l'écran principal
      Navigator.pushReplacementNamed(context, '/home');
      // Ou si tu veux un écran personnalisé :
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      return;
    }

    if (newIndex < 0) return;

    setState(() {
      _currentIndex = newIndex;
    });
  }

  // Revenir à l'étape précédente
  void _previousStep() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    } else {
      Navigator.pop(context); // Sortir si on est sur la première étape
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Écran actuel avec animation fluide
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              transitionBuilder: (child, animation) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation);

                final reverseAnimation = Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation);

                return SlideTransition(
                  position: _currentIndex > (child.key as ValueKey<int>).value
                      ? offsetAnimation
                      : reverseAnimation,
                  child: child,
                );
              },
              child: Container(
                key: ValueKey<int>(_currentIndex),
                child: _widgets[_currentIndex],
              ),
            ),

            // Bouton retour personnalisé (sauf sur l'écran d'accueil email)
            if (_currentIndex > 0)
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
                      onPressed: _previousStep,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}