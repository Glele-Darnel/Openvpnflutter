// lib/screen/home/HomeScreen.dart
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> with TickerProviderStateMixin {
  bool _isConnected = false;

  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.35).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _toggleVpn() {
    setState(() {
      _isConnected = !_isConnected;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isConnected
              ? 'Connexion VPN établie avec succès !'
              : 'Déconnecté du VPN',
        ),
        backgroundColor: _isConnected ? Colors.green : Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: _isConnected ? 2 : 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'BIRISVPN',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // TODO: Ouvrir les paramètres
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Cercle animé avec pulsation
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _isConnected ? _pulseAnimation.value : 1.0,
                  child: Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isConnected
                          ? Colors.green.withOpacity(0.15)
                          : Colors.grey.withOpacity(0.1),
                      border: Border.all(
                        color: _isConnected ? Colors.green : Colors.grey.shade400,
                        width: 7,
                      ),
                      boxShadow: _isConnected
                          ? [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.3),
                                blurRadius: 30,
                                spreadRadius: 5,
                              ),
                            ]
                          : null,
                    ),
                    child: Icon(
                      Icons.vpn_lock_rounded,
                      size: 100,
                      color: _isConnected ? Colors.green : Colors.grey.shade600,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 60),

            // Message principal en vert quand connecté
            Text(
              _isConnected ? 'BIRISVPN Connecté' : 'BIRISVPN Déconnecté',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: _isConnected ? Colors.green.shade600 : Colors.black87,
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                _isConnected
                    ? 'Votre connexion est chiffrée et anonyme'
                    : 'Touchez le bouton pour vous connecter',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 70),

            // Gros bouton de connexion
            SizedBox(
              width: 240,
              height: 240,
              child: FloatingActionButton(
                elevation: 15,
                backgroundColor: _isConnected ? Colors.redAccent : Colors.green,
                onPressed: _toggleVpn,
                shape: const CircleBorder(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _isConnected ? Icons.power_settings_new : Icons.vpn_key,
                      size: 90,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _isConnected ? 'DÉCONNECTER' : 'CONNECTER',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 90),

            // Informations serveur quand connecté
            if (_isConnected)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.green.withOpacity(0.4)),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Serveur : France - Paris',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'IP : 178.32.124.••• • OpenVPN • 256-bit',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}