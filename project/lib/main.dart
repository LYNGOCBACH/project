import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoflutter/screens/login_screen.dart';
import 'package:todoflutter/screens/signup_screen.dart';
import 'package:todoflutter/screens/welcome.dart';
import 'pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // init the hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Welcome(),
      initialRoute: 'welcome',
routes: {
  '/login': (context) => LoginScreen(),
  '/signup': (context) => SignUpScreen(),
  // '/homepage': ((context) => HomePage()),
  '/welcome': (context) => Welcome(),
  // '/home': (context) => Home(),
},
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: Text('Welcome to the Home screen!'),
//       ),
//     );
//   }
// }
