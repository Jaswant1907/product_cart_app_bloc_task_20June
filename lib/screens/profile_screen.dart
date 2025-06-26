import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/man2.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'Malik Shahzein',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Proficient flutter developer.Give a best project to the market for better result and innovation.I believe to  innovate something new and big in the world',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  ContactInfo(icon: Icons.email, text: 'chpl_test@example.com'),
                  ContactInfo(icon: Icons.phone, text: '+1 9856 365 658'),
                  ContactInfo(icon: Icons.link, text: 'www.chplDeveloper.com'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  ContactInfo({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
