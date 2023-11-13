import 'package:flutter/material.dart';
import 'package:test/pages/pays-details.dart';


class paysPage extends StatelessWidget {
  TextEditingController txt_pays = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page pays')),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            controller: txt_pays,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_pin),
                hintText: "Pays",
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
    String v = txt_pays.text;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>paysDetailsPage (v)));
    txt_pays.text = "";
  }
}