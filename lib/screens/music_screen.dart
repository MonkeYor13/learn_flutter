import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            backgroundColor: Colors.pinkAccent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('PineApple Musik'),
              background: Image.asset(
                'assets/batman.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _CardForm(),
          )
        ],
      ),
    );
  }
}

class _CardForm extends StatefulWidget {
  const _CardForm();

  @override
  State<_CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<_CardForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _userCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _dateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 30, color: Colors.pinkAccent),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _userCtrl,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) return 'Add User name';
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'User',
                        icon: Icon(
                          Icons.person,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _emailCtrl,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) return 'Add Email';
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordCtrl,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) return 'Add Your Password';
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        icon: Icon(
                          Icons.key,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: _dateCtrl,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) return 'Add Your BirthDay';
                        return null;
                      },
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        _selectDate();
                      },
                      decoration: InputDecoration(
                        labelText: 'Date',
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                    
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1950),
      lastDate: now,
    );
    if (picked != null) {
      _dateCtrl.text = picked.toString();

      debugPrint(_dateCtrl.text);
    }
  }
}
