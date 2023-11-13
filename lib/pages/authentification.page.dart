import 'package:flutter/material.dart';

class authentificationPage extends StatelessWidget {
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page authentification')),
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
                prefixIcon: Icon(Icons.password),
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
            onPressed: () {},
            child: Text(
              'Connexion',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        TextButton(
          child: Text('Nouvelle Utilisateur', style: TextStyle(fontSize: 22)),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/inscription');
          },
        )
      ]),
    );
  }
}
