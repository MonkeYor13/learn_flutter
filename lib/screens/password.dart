import 'package:flutter/material.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _formKey = GlobalKey();
  final _passwordCtrl = TextEditingController();
  bool isVisible = false;
  final passNotifier = ValueNotifier<PasswordStrength?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
            child: Column(
          children: [
            Text('registro', style: TextStyle(),)
          ],
        )),
      ),
    );
  }
}
