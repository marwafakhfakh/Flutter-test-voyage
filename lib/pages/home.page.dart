import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/config/global.params.dart';
import 'package:test/menu/drawer.widget.dart';

class homePage extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text('Page home')),
      body: Center(
        child: Wrap(
          children: [
            ...(GlobalParams.accueil as List).map((e) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "${e['routes']}");
                },
                child: Ink.image(
                  height: 180,
                  width: 180,
                  image: AssetImage('${e['image']}'),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Future<void> _deconnexion(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('connecte', false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/authentification', (Route<dynamic> route) => false);
  }
}
