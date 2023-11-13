import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class inscriptionPage extends StatelessWidget {
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Inscription')),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            controller: txt_login,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Utilisateur",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1))),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            controller: txt_password,
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1))),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50)),
            onPressed: () {
              _onInscrire(context);
            },
            child: Text(
              'Inscription',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        TextButton(
          child: Text("j'ai deja un compte", style: TextStyle(fontSize: 22)),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/authentification');
          },
        )
      ]),
    );
  }

  Future<void> _onInscrire(BuildContext context) async {
   try {
 
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: txt_login.text,
    password:  txt_password.text,
  );
   Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
} on FirebaseAuthException catch (e) {
  const snackBar = SnackBar(content: Text('verifier'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }
}



/* if (txt_login.text.isNotEmpty && txt_password.text.isNotEmpty) {
      prefs.setString("login", txt_login.text);
      prefs.setString("password", txt_password.text);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } else {
      const snackBar = SnackBar(content: Text('verifier'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }*/