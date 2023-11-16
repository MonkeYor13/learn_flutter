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
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  onChanged: (value) {
                    passNotifier.value =
                        PasswordStrength.calculate(text: value);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                PasswordStrengthChecker(
                  strength: passNotifier,
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 40.0,
                  child: MaterialButton(
                    onPressed: () {
                      PasswordGeneratorConfiguration config =
                          PasswordGeneratorConfiguration(
                              length: 32,
                              minUppercase: 8,
                              minSpecial: 8,
                              minDigits: 4,
                              minLowercase: 2);
                      final passwordGenerator =
                          PasswordGenerator.fromConfig(configuration: config);
                      final password = passwordGenerator.generate();

                      setState(() {
                        _passwordCtrl.text = password;
                        passNotifier.value =
                            PasswordStrength.calculate(text: password);
                      });
                    },
                    color: Colors.amberAccent,
                    child: Text('Generate Password'),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 40.0,
                  child: MaterialButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      if (passNotifier.value == PasswordStrength.secure) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Password Secure and Procesaded'),
                          backgroundColor: Colors.green,
                        ));
                        return;
                      }
                      if (passNotifier.value == PasswordStrength.strong) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Password is Good but not secure.'),
                          backgroundColor: Colors.yellow,
                        ));
                        return;
                      }
                      if (passNotifier.value == PasswordStrength.medium) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Password isn't Strong and secure."),
                          backgroundColor: Colors.orange,
                        ));
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Ohh! Password not secure.'),
                        backgroundColor: Colors.red,
                      ));
                    },
                    color: Colors.amberAccent,
                    child: Text('Submit'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
