import 'dart:convert' as convert;
import 'package:flutter/services.dart';

class Artist {
  String name = '';
  String link = '';
  String about = '';
}

Future<List<Artist>> getArtists() async {
  var rawData = await rootBundle.loadString('assets/artists_data.json');
  var json = convert.jsonDecode(rawData.toString());

  List<Artist> results = [];

  for (var jsonA in json) {
    Artist artist = Artist();
    artist.name = jsonA['name'];
    artist.link = jsonA['link'];
    artist.about = jsonA['about'];
    results.add(artist);
  }

  return results;
}
