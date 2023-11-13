import 'package:flutter/material.dart';
import 'package:test/pages/meteo-details.page.dart';

class meteoPage extends StatelessWidget {
  TextEditingController txt_ville = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page meteo')),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            controller: txt_ville,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_city),
                hintText: "Ville",
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
              onGetMeteoDetails(context);
            },
            child: Text(
              'Chercher',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
      ]),
    );
  }

  void onGetMeteoDetails(BuildContext context) {
    String v = txt_ville.text;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => meteoDetailsPage(v)));
    txt_ville.text = "";
  }
}
