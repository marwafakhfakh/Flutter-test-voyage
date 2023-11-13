import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class meteoDetailsPage extends StatefulWidget {
  final String ville;

  meteoDetailsPage(this.ville);

  @override
  _MeteoDetailsPageState createState() => _MeteoDetailsPageState();
}

class _MeteoDetailsPageState extends State<meteoDetailsPage> {
  @override
  var meteoData;
  void initState() {
    super.initState();
    getMeteoData(widget.ville);
  }

  void getMeteoData(String ville) {
    print("Météo de la ville de " + ville);
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=${ville}&appid=c109c07bc4df77a88c923e6407aef864";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.meteoData = json.decode(resp.body);
      });
      print(this.meteoData);
    }).catchError((err) {
      print(err);
    });
  }

  String getWeatherImage(String weatherState) {
    switch (weatherState) {
      case 'Clear':
        return 'images/suny.png';
      case 'Clouds':
        return 'images/cloud.png';
      case 'Rain':
        return 'images/rain.png';
      default:
        return 'images/default.png';
    }
  }

  String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Page Meteo Details ${widget.ville}')),
        body: meteoData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: (meteoData == null ? 0 : meteoData['list'].length),
                itemBuilder: (context, index) {
                  final weatherData = meteoData['list'][index];
                  final temperature = weatherData['main']['temp'];
                  final date = DateTime.fromMillisecondsSinceEpoch(
                      weatherData['dt'] * 1000);

                  return Card(
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(getWeatherImage(
                                  weatherData['weather'][0]['main'])),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(formatDate(
                                    date)), // Afficher la date locale
                                Text(
                                    '${date.hour}:${date.minute} | ${weatherData['weather'][0]['description']}'),
                              ],
                            ),
                          ],
                        ),
                        Text(
                            '${temperature}°C'), // Afficher la température avec 2 décimales
                      ],
                    ),
                  );
                },
              ));
  }
}
