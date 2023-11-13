import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test/firebase_options.dart';
import 'package:test/pages/authentification.page.dart';
import 'package:test/pages/contact.page.dart';
import 'package:test/pages/gallerie.page.dart';
import 'package:test/pages/home.page.dart';
import 'package:test/pages/inscription.page.dart';
import 'package:test/pages/meteo.page.dart';
import 'package:test/pages/parametres.page.dart';
import 'package:test/pages/pays.page.dart';

//void main() {
  //runApp(MyApp());}
  Future<void> main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    runApp(MyApp());
  }


class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => homePage(),
    '/inscription': (context) => inscriptionPage(),
    '/authentification': (context) => authentificationPage(),
    '/menu/contact': (context) => contactPage(),
    '/menu/gallerie': (context) => galleriePage(),
    '/menu/parametres': (context) => parametresPage(),
    '/menu/pays': (context) => paysPage(),
    '/menu/meteo': (context) => meteoPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.hasData)
          return homePage();
          else
          return authentificationPage();
      },
      )
      // inscriptionPage(),
      //routes: routes,
    );
  }
}
