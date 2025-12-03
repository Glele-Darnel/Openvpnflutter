import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Auth VPN'),
        ),
        body: Center(
          child:SingleChildScrollView(child: ,)
          Padding: EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Titre principal
                RichText(
                  text: const TextSpan(
                    text: 'BIENVENUE SUR\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                    children: [
                      TextSpan(
                        text: 'LA PLATEFORME DE SECURISATION DE COMMUNIQUATION\n',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ':BIRISVPN.',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:10.0,
                ),
                const SizedBox(height: 16.0),

                const Text(
                  'Communiquer en toute sécurité.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 24.0),

                // Formulaire
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Entrer votre Email'),
                      const SizedBox(height: 10.0),

                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Ex: john@gmail.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16.0),

                      SizedBox(
                        
                      
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => print('send'),
                          child: Text('CONTINUER'.toUpperCase()),
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
