import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/config/global.params.dart';

class CustomDrawer extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.white, Colors.pink])),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/marwa.png"),
                  radius: 80,
                ),
              )),
          ...(GlobalParams.menu as List).map((item) {
            return ListTile(
                title: Text(
                  '${item['title']}',
                  style: const TextStyle(fontSize: 22),
                ),
                leading: item['icon'],
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.pink,
                ),
                onTap: () async {
                  if ('${item['title']}' != "Déconnexion") {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, "${item['route']}");
                  } else {
                    prefs = await SharedPreferences.getInstance();
                    prefs.setBool('connect', false);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/authentification', (route) => false);
                  }
                });
          })
        ],
      ),
    );
  }
}
