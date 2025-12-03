import 'package:flutter/material.dart';

class TermScreen extends StatefulWidget {
  // Callback pour passer à l'étape suivante (ex: vers PasswordScreen)
  final Function(int)? onChangedStep;

  const TermScreen({Key? key, this.onChangedStep}) : super(key: key);

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text(
            'Terms & Conditions',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Conditions Générales d’Utilisation (CGU)",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Application BIRISVPN",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Text(
                "Version en vigueur au 03 décembre 2025\n",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // === Toutes tes sections (inchangées) ===
              _buildSectionTitle("1. Définitions"),
              _buildParagraph(
                  "• Société : BIRISVPN, SARL au capital de 10 000 €, immatriculée au RCS de Cotonou sous le numéro [à compléter], siège social [adresse complète à insérer].\n"
                  "• Application : L’application mobile et/ou logicielle BIRISVPN ainsi que toutes ses mises à jour.\n"
                  "• Service : Le service de réseau privé virtuel (VPN) fourni via l’Application.\n"
                  "• Utilisateur : Toute personne physique ou morale utilisant l’Application et/ou le Service."),

              _buildSectionTitle("2. Acceptation des CGU"),
              _buildParagraph(
                  "L’installation, l’ouverture ou l’utilisation de l’Application et du Service vaut acceptation pleine et entière des présentes Conditions Générales d’Utilisation. Si vous n’acceptez pas ces conditions, vous devez immédiatement désinstaller l’Application et cesser toute utilisation du Service."),

              _buildSectionTitle("3. Description du Service"),
              _buildParagraph(
                  "L’Application permet de sécuriser votre connexion Internet, de masquer votre adresse IP réelle et de contourner certaines restrictions géographiques en acheminant votre trafic via des serveurs distants exploités par la Société ou ses partenaires."),

              _buildSectionTitle("4. Accès au Service"),
              _buildParagraph(
                  "4.1. L’Application est disponible sur iOS, Android, Windows, macOS et les autres plateformes officiellement annoncées.\n"
                  "4.2. Certains pays, fournisseurs d’accès ou réseaux peuvent bloquer l’accès au Service ; la Société ne peut être tenue responsable de ces restrictions.\n"
                  "4.3. Vous êtes seul responsable de la compatibilité de votre appareil et de la qualité de votre connexion Internet."),

              _buildSectionTitle("5. Comptes et abonnements"),
              _buildParagraph(
                  "5.1. La création d’un compte peut être nécessaire pour accéder à l’ensemble des fonctionnalités.\n"
                  "5.2. Vous vous engagez à fournir des informations exactes et à les maintenir à jour.\n"
                  "5.3. Les abonnements payants sont proposés aux tarifs affichés dans l’Application ou sur le site officiel au moment de la souscription.\n"
                  "5.4. Les abonnements sont reconduits tacitement sauf résiliation avant la fin de la période en cours.\n"
                  "5.5. Les paiements sont traités par les plateformes tierces (Apple App Store, Google Play, Stripe, etc.). Les conditions de remboursement sont celles appliquées par ces plateformes, sauf mention contraire expressément indiquée dans l’Application."),

              _buildSectionTitle("6. Utilisations autorisées et interdites"),
              _buildParagraph(
                  "Vous vous engagez à utiliser le Service conformément aux lois applicables dans votre pays de résidence et dans le pays où est situé le serveur utilisé.\n\n"
                  "Il est strictement interdit d’utiliser le Service pour :\n"
                  "• commettre ou faciliter toute infraction pénale (terrorisme, pédopornographie, escroquerie, etc.)\n"
                  "• porter atteinte aux droits de tiers (diffamation, contrefaçon, harcèlement, etc.)\n"
                  "• effectuer des attaques informatiques, du piratage ou toute intrusion non autorisée\n"
                  "• contourner illicitement des mesures de protection technologique\n"
                  "• diffuser du spam, du phishing ou des malwares.\n\n"
                  "En cas de violation grave ou répétée, la Société se réserve le droit de suspendre ou résilier immédiatement votre compte sans préavis ni remboursement."),

              _buildSectionTitle("7. Politique « No-Log »"),
              _buildParagraph(
                  "La Société s’engage à ne conserver aucun journal d’activité de navigation, aucune adresse IP de destination, ni aucun horodatage permettant de vous identifier. Seules les données strictement nécessaires au fonctionnement technique du Service et à la facturation sont conservées temporairement."),

              _buildSectionTitle("8. Garanties et responsabilité"),
              _buildParagraph(
                  "8.1. Le Service est fourni « en l’état », sans garantie de disponibilité permanente, de vitesse constante ou d’absence d’interruption.\n"
                  "8.2. La Société ne saurait être tenue responsable :\n"
                  "• des contenus que vous consultez ou téléchargez\n"
                  "• des blocages imposés par des autorités ou fournisseurs d’accès\n"
                  "• des dommages causés par des virus, attaques externes ou pertes de données\n"
                  "• des interruptions liées à la maintenance ou à des cas de force majeure."),

              _buildSectionTitle("9. Propriété intellectuelle"),
              _buildParagraph(
                  "L’Application, son interface, ses logos, son code source et toutes les marques associées sont la propriété exclusive de la Société. Toute reproduction ou exploitation non autorisée est strictement interdite."),

              _buildSectionTitle("10. Résiliation"),
              _buildParagraph(
                  "10.1. Vous pouvez résilier votre compte à tout moment depuis les paramètres de l’Application.\n"
                  "10.2. La Société peut suspendre ou résilier définitivement votre compte en cas de violation des présentes CGU ou pour tout motif légitime, sans indemnité ni remboursement du temps restant."),

              _buildSectionTitle("11. Droit applicable et juridiction"),
              _buildParagraph(
                  "Les présentes CGU sont régies par le droit béninois. Tout litige relatif à leur interprétation ou exécution sera soumis aux tribunaux compétents de Cotonou."),

              _buildSectionTitle("12. Modifications des CGU"),
              _buildParagraph(
                  "La Société se réserve le droit de modifier à tout moment les présentes Conditions. Vous serez informé des modifications par notification dans l’Application ou par e-mail. L’utilisation continue du Service après entrée en vigueur des modifications vaut acceptation des nouvelles conditions."),

              _buildSectionTitle("13. Contact"),
              _buildParagraph("Pour toute question ou réclamation : support@birisvpn.com"),

              const SizedBox(height: 40),

              // Bouton Accepter & Continuer → passe à l'étape suivante
              SizedBox(
                width: double.infinity,
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
                    // Passe à l'écran suivant (PasswordScreen = index 2)
                    widget.onChangedStep?.call(2);
                  },
                  child: const Text(
                    "ACCEPTER & CONTINUER",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 15, height: 1.6, color: Colors.black87),
    );
  }
}