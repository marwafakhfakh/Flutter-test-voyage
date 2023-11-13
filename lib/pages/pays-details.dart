import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class paysDetailsPage extends StatefulWidget {
  final String pays;

  paysDetailsPage(this.pays);

  @override
  _PaysDetailsPageState createState() => _PaysDetailsPageState();
}

class _PaysDetailsPageState extends State<paysDetailsPage> {
  @override
  var paysData;
  void initState() {
    super.initState();
    getPaysData(widget.pays);
  }

  void getPaysData(String pays) {
    print("Pays : " + pays);
    String url = "https://restcountries.com/v2/name/${pays}";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        final responseBody = resp.body.codeUnits;
        this.paysData = json.decode(utf8.decode(responseBody));
      });
      print(this.paysData);
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Pays Details ${widget.pays}')),
      body: Container(
        // padding: EdgeInsets.only(bottom: 20,top: 20),
        margin: EdgeInsets.only(left: 60, right: 40),
        child: this.paysData != null
            ? Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    //      mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(this.paysData[0]['flags']['png'],
                          width: 300, height: 300),
                    ],
                  ),
                  Container(
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this.paysData[0]['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          this.paysData[0]['nativeName'],
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Administration',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 241, 19, 3),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Capitale :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text(this.paysData[0]['capital']),
                        Text('Language(s): Arabic'),
                        Text(
                          'Géographie',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 241, 19, 3),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Région : ${this.paysData[0]['region']}'),
                        Text('Superficie: ${this.paysData[0]['area']}'),
                        Text(
                            'Fuseau Horaire : ${this.paysData[0]['timezones'][0]}'),
                        Text(
                          'Démographie',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 241, 19, 3),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Population: ${this.paysData[0]['population']}'),
                      ],
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
