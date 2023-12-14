import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
 
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
 
class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  String _email = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter You Email";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "PassWord",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter You PassWord";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
 