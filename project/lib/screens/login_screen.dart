import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
 
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
 
class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  String _email = "";
  String _password = "";
  void _hanleLogin() async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email, password: _password);
        print("User Logged In: ${userCredential.user!.email}");
    }catch (e){
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              SizedBox(height: 20,),
              TextFormField(
                controller: _passController,
                obscureText: true,
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
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  _hanleLogin();
                }
              }, child: Text('Login')),
            ]),
          ),
        ),
      ),
    );
  }
}