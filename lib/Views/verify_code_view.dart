import 'package:flutter/material.dart';

class VerifyCodeView extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Image.asset('assets/logo.png', height: 100),
            SizedBox(height: 20),
            Text('Vérifiez le code', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 8),
            Text('Veuillez renseigner le code reçu', style: TextStyle(color: Colors.black54)),
            SizedBox(height: 20),
            TextField(
              controller: codeController,
              decoration: InputDecoration(
                hintText: '---- ---- ---- ----',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement code verification logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: Text('Vérifier le code', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
