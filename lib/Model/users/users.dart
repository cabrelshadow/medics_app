import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class User {
  String nom;
  String prenom;
  String email;
  String password;

  User({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
      password: map['password'],
    );
  }
}


Future<void> registerUser(User user) async {
  try {
    auth.UserCredential userCredential = await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    await FirebaseFirestore.instance.collection('Users').doc(userCredential.user?.uid).set(user.toMap());
  } catch (e) {
    print(e);
  }
}
Future<String?> loginUser(String email, String password) async {
  try {
    auth.UserCredential userCredential = await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user?.uid;
  } catch (e) {
    return 'Email ou mot de passe incorrect';
  }
}
