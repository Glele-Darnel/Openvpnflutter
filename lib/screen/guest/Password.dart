import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  // Callback pour passer à l'étape suivante (ex: écran principal après connexion)
  final Function(int)? onChangedStep;

  const PasswordScreen({Key? key, this.onChangedStep}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _isSecret = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Text(
                  'Mot de passe'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 50.0),

                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Entrer votre mot de passe',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      const SizedBox(height: 10.0),

                      TextFormField(
                        obscureText: _isSecret,
                        decoration: InputDecoration(
                          hintText: 'Ex: ghD4M@',
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _isSecret = !_isSecret;
                              });
                            },
                            child: Icon(
                              _isSecret ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez saisir votre mot de passe';
                          }
                          if (value.length < 6) {
                            return 'Minimum 6 caractères';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 40.0),

                      // Bouton CONTINUER → passe à l'étape suivante
                      SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Feedback visuel
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Connexion réussie !'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 1),
                                ),
                              );

                              // Passe à l'étape suivante
                              // 3 = écran principal, dashboard, ou fin du flux
                              widget.onChangedStep?.call(3);
                            }
                          },
                          child: const Text(
                            'CONTINUER',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}