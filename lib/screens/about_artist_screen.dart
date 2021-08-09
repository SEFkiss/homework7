import 'package:flutter/material.dart';
import 'package:home_work_7/functions/any_functions.dart';
import 'package:home_work_7/models/artist.dart';

class AboutArtistsScreen extends StatefulWidget {
  static const routeName = '/about_artist';
  AboutArtistsScreen({Key? key, required this.link, required this.index})
      : super(key: key);

  final int index;
  final String link;

  @override
  _AboutArtistsScreenState createState() => _AboutArtistsScreenState();
}

class _AboutArtistsScreenState extends State<AboutArtistsScreen> {
  List<Artist>? artists;
  Object? error;

  void loadData() async {
    try {
      var artistsLoad = await getArtists();
      setState(() {
        artists = artistsLoad;
      });
    } catch (exception) {
      setState(() {
        error = exception;
        print("Не удалось получить Json файл");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(artists != null
            ? convertToTitleCase(artists![widget.index].name.toString())
            : ''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(artists != null
                  ? artists![widget.index].about.toString()
                  : ''),
            ))
          ],
        ),
      ),
    );
  }
}
