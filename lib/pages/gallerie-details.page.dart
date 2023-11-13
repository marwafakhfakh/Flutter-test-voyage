import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class gallerieDetailsPage extends StatefulWidget {
  final String image;
  gallerieDetailsPage(this.image);

  @override
  _GallerieDetailsPageState createState() => _GallerieDetailsPageState();
}

class _GallerieDetailsPageState extends State<gallerieDetailsPage> {
  @override
  var gallerieData;
  List<dynamic> hits = [];
  int currentPage = 1;
  int size = 10;
  int totalPages = 0;
  ScrollController _scrollController = ScrollController();
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void initState() {
    super.initState();
    getGallerieData(widget.image);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          currentPage++;
          getGallerieData(widget.image);
        }
      }
    });
  }

  void getGallerieData(String keywords) {
    String url =
        "https://pixabay.com/api/?key=40009359-89bd7d67403225d01ba33a825&q=$keywords&page=$currentPage&per_page=$size";
    http.get(Uri.parse(url)).then((response) {
      setState(() {
        gallerieData = json.decode(response.body);
        hits.addAll(gallerieData['hits']);
        totalPages = (gallerieData['totalHits'] / size).ceil();
      });
    }).catchError((err) {
      print('Error $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
                "Page Gallery ${widget.image} ${totalPages == 0 ? '0 Résultat' : 'Page $currentPage/$totalPages'}")),
        body: gallerieData == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                controller: _scrollController,
                itemCount: (hits.length),
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(hits[index]['largeImageURL'],
                              fit: BoxFit.fitWidth),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(hits[index]['tags'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                  );
                }));
  }
}
