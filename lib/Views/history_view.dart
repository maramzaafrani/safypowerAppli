import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Image.asset('assets/logo.png', height: 100),
            SizedBox(height: 20),
            Text(
              'Votre Historique',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            _buildHistoryItem('Aujourd\'hui', '12.12h - 13h', '47mins', '11 Rue de Molinel, 10eme arr., Paris'),
            _buildHistoryItem('3 Sept. 2023', '12.12h - 13h', '47mins', '11 Rue de Molinel, 10eme arr., Paris'),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(1), // Adjust the index accordingly
    );
  }

  Widget _buildHistoryItem(String date, String time, String duration, String address) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(time, style: TextStyle(color: Colors.black)),
            SizedBox(height: 5),
            Text('Durée: $duration', style: TextStyle(color: Colors.black)),
            SizedBox(height: 5),
            Text(address, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(int currentIndex) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    );
  }
}
