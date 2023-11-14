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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Registro',
                  style: TextStyle(),
                ),
                Text(PasswordStrength.instructions),
                TextField(
                  controller: _passwordCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    //helperText: "ggg",
                    suffixIcon: IconButton(
                      onPressed: () {
                        isVisible =!isVisible;
                      },
                      icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                    suffixStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    icon: Icon(Icons.password),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
