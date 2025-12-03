// lib/screen/guest/GuestScreen.dart
import 'package:flutter/material.dart';
import 'package:vpn/screen/guest/Auth.dart';
import 'package:vpn/screen/guest/Term.dart';
import 'package:vpn/screen/guest/Password.dart';
import 'package:vpn/screen/guest/home.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  late final List<Widget> _screens;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _screens = [
      AuthScreen(onChangedStep: _changeStep),
      TermScreen(onChangedStep: _changeStep),
      PasswordScreen(onChangedStep: _changeStep),
    ];
  }

  void _changeStep(int index) {
    if (index >= _screens.length) {
      // Authentification terminée → écran principal
      Navigator.pushReplacementNamed(context, '/home');
      return;
    }

    if (index < 0 || index == _currentIndex) return;

    setState(() => _currentIndex = index);
  }

  void _goBack() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Écran courant avec transition fluide
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 340),
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,
              transitionBuilder: (child, animation) {
                final isForward = _currentIndex > 
                    (child.key is ValueKey<int> ? (child.key as ValueKey<int>).value : _currentIndex);

                final offset = isForward 
                    ? const Offset(1.0, 0.0)
                    : const Offset(-1.0, 0.0);

                return SlideTransition(
                  position: Tween<Offset>(begin: offset, end: Offset.zero)
                      .animate(animation),
                  child: child,
                );
              },
              child: SizedBox(
                key: ValueKey<int>(_currentIndex),
                width: double.infinity,
                height: double.infinity,
                child: _screens[_currentIndex],
              ),
            ),

            // Bouton retour stylé (sauf sur l'écran d'email)
            if (_currentIndex > 0)
              Positioned(
                top: 12,
                left: 12,
                child: SafeArea(
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    elevation: 8,
                    shadowColor: Colors.black26,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: _goBack,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black87,
                          size: 22,
                        ),
                      ),
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