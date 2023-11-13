import 'package:flutter/material.dart';
import 'package:test/pages/gallerie-details.page.dart';

class galleriePage extends StatelessWidget {
  TextEditingController txt_gallerie = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page gallerie')),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            controller: txt_gallerie,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.image),
                hintText: "Image",
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
    String v = txt_gallerie.text;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>gallerieDetailsPage (v)));
    txt_gallerie.text = "";
  }
}
