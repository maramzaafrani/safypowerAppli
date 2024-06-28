import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginView extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 100),
            SizedBox(height: 20),
            Text('Connectez-vous', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
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
                // Implement phone login logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: Text('Se Connecter', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            CheckboxListTile(
              value: true,
              onChanged: (bool? value) {
                // Implement remember me logic
              },
              title: Text('Se souvenir de moi', style: TextStyle(color: Colors.black54)),
            ),
            SizedBox(height: 20),
            Text('Ou continuer avec', style: TextStyle(color: Colors.black54)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('assets/google_icon.png', height: 40), // Ajustez la taille de l'icône si nécessaire
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
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/createAccount');
              },
              child: Text("Vous n’avez pas de compte? Inscrivez-vous", style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
