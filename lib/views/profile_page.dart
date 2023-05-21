import 'package:flutter/material.dart';
import 'package:valorant_app/common/styles.dart';
import 'package:valorant_app/views/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const routeName = '/profile_page';

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Player Profile',
          style: TextStyle(
            color: secondaryColor,
            fontFamily: 'Tungsten-Bold',
            fontSize: 32,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Full Name',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Rafli Irfansyah Kusumawardhana',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Medium',
                fontSize: 16,
                color: accentColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Nickname',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'MagicKey',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Medium',
                fontSize: 16,
                color: accentColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'NIM',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              '123200084',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Medium',
                fontSize: 16,
                color: accentColor,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              child: const Text('Logut'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logout Success'),
                    backgroundColor: successColor,
                    duration: Duration(seconds: 2 ),
                  ),
                );
                Navigator.pushReplacementNamed(
                  context,
                  LoginPage.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
