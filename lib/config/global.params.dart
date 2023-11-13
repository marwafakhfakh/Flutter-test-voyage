import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menu = [
    {
      "title": "Accueil",
      "icon": const Icon(
        Icons.home,
        color: Colors.pink,
      ),
      "route": "/home"
    },
    {
      "title": "Météo",
      "icon": const Icon(
        Icons.sunny_snowing,
        color: Colors.pink,
      ),
      "route": "/menu/meteo"
    },
    {
      "title": "Gallerie",
      "icon": const Icon(
        Icons.image,
        color: Colors.pink,
      ),
      "route": "/menu/galery"
    },
    {
      "title": "Pays",
      "icon": const Icon(
        Icons.location_city,
        color: Colors.pink,
      ),
      "route": "/menu/pays"
    },
    {
      "title": "Contact",
      "icon": const Icon(
        Icons.contact_page,
        color: Colors.pink,
      ),
      "route": "/menu/contact"
    },
    {
      "title": "Paramétres",
      "icon": const Icon(
        Icons.settings,
        color: Colors.pink,
      ),
      "route": "/menu/contact"
    },
    {
      "title": "Déconnexion",
      "icon": const Icon(
        Icons.logout_outlined,
        color: Colors.pink,
      ),
      "route": "/authentification"
    }
  ];
  static List<Map<String, dynamic>> accueil = [
    {"image": "images/metéo.png", "routes": "/menu/meteo"},
    {"image": "images/galery.jpg", "routes": "/menu/gallerie"},
    {"image": "images/paramet.png", "routes": "/menu/parametres"},
   {"image": "images/Terre.jpg", "routes": ""},
      {"image": "images/rain.png", "routes": ""},
      {"image": "images/suny.png", "routes": ""}
  ];
}
