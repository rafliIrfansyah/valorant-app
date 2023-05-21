import 'package:flutter/material.dart';
import 'package:valorant_app/common/styles.dart';
import 'package:valorant_app/views/register_page.dart';
import 'package:valorant_app/data/database/database_helper.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:valorant_app/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/login_page';
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
  }

  void _login() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username or Password Cannot be Empty'),
          backgroundColor: primaryColor,
          duration: Duration(seconds: 2 ),
        ),
      );
    } else {
      User? user = await _databaseHelper.getUserByUsername(username);

      if (user != null &&
          await FlutterBcrypt.verify(password: password, hash: user.password)) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Success'),
              backgroundColor: successColor,
              duration: Duration(seconds: 2 ),
            ),
          );
          Navigator.pushReplacementNamed(
            context,
            HomePage.routeName,
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Failed'),
              backgroundColor: primaryColor,
              duration: Duration(seconds: 2 ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Welcome to Valorant!',
          style: TextStyle(
            color: secondaryColor,
            fontFamily: 'Tungsten-Bold',
            fontSize: 32,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/valorant-logo.png'),
                width: 165,
                height: 165,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: primaryColor),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                style: const TextStyle(color: primaryColor),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    _login();
                  }),
              const SizedBox(height: 32.0),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RegisterPage.routeName,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Don't have an account yet?",
                        style: TextStyle(
                            fontFamily: 'URW DIN W05 Medium',
                            color: accentColor)),
                    Text(
                      ' Register',
                      style: TextStyle(
                        fontFamily: 'URW DIN W05 Bold',
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
