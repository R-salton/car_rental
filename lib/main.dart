import 'package:car_rental/firebase_options.dart';
import 'package:car_rental/presentation/pages/car_details.dart';
import 'package:car_rental/presentation/pages/map_details.dart';
import 'package:car_rental/presentation/pages/onboarding_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  FirebaseFirestore db = FirebaseFirestore.instance;
  void addUser() {
    final user = {
      "firstname": "salton",
      "lastname": "Neza",
      "userId": 001,
    };
    db.collection("users").add(user).then((DocumentReference doc) =>
        print("The user with user ID: ${doc.id} has been added successfully"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(body: MapDetails(),),
    );
  }
}
