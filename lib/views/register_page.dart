import 'package:flutter/material.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:valorant_app/common/styles.dart';
import 'package:valorant_app/data/database/database_helper.dart';
import 'package:valorant_app/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const routeName = '/register_page';

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  bool _passwordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
  }

  void _register() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Username or Password Cannot be Empty',
          ),
          backgroundColor: primaryColor,
          duration: Duration(seconds: 2 ),
        ),
      );
    } else {
      User? existingUser = await _databaseHelper.getUserByUsername(username);

      if (existingUser != null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Username Already Exists!'),
              backgroundColor: primaryColor,
              duration: Duration(seconds: 2 ),
            ),
          );
        }
      } else {
        String hashedPassword = await FlutterBcrypt.hashPw(
            password: password, salt: await FlutterBcrypt.salt());
        User newUser = User(username: username, password: hashedPassword);
        await _databaseHelper.insertUser(newUser);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Register Success'),
              backgroundColor: successColor,
              duration: Duration(seconds: 2 ),
            ),
          );
          Navigator.pushReplacementNamed(
            context,
            LoginPage.routeName,
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
          'Prepare for Battle!',
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
                child: const Text('Register'),
                onPressed: () {
                  _register();
                },
              ),
              const SizedBox(height: 32.0),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    LoginPage.routeName,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Already have an account ?",
                        style: TextStyle(
                            fontFamily: 'URW DIN W05 Medium',
                            color: accentColor)),
                    Text(
                      ' Sign In',
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
