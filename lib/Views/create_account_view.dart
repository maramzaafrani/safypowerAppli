import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CreateAccountView extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 100),
            SizedBox(height: 20),
            Text('Créer votre compte', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 8),
            Text('Veuillez renseigner votre numéro de téléphone', style: TextStyle(color: Colors.black54)),
            SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Numéro de téléphone',
                prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.black54),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement phone verification logic
                Navigator.pushNamed(context, '/verifyCode');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: Text('Envoyer le code de vérification', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            Text('Sinon, créer un compte avec', style: TextStyle(color: Colors.black54)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('assets/google_icon.png', height: 40), // Adjust size
                  onPressed: () async {
                    try {
                      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
                      if (googleUser != null) {
                        // Connexion réussie, vous pouvez maintenant accéder aux détails de l'utilisateur si nécessaire
                        String email = googleUser.email ?? '';
                        String displayName = googleUser.displayName ?? '';
                        String photoUrl = googleUser.photoUrl ?? '';
                        // Vous pouvez également utiliser googleUser.authentication pour obtenir les informations d'authentification

                        // Après avoir récupéré les informations, vous pouvez rediriger l'utilisateur vers une nouvelle page ou effectuer d'autres actions
                        // Exemple de redirection vers une nouvelle page :
                        Navigator.pushNamed(context, '/home');
                      } else {
                        // L'utilisateur a annulé la connexion
                      }
                    } catch (error) {
                      // Gestion des erreurs lors de la connexion avec Google
                      print('Error signing in with Google: $error');
                    }
                  },
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Image.asset('assets/apple_icon.png', height: 40), // Adjust size
                  onPressed: () {
                    // Implement Apple Sign-In logic
                  },
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Image.asset('assets/email.png', height: 40), // Adjust size
                  onPressed: () {
                    // Implement Email Sign-In logic
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
