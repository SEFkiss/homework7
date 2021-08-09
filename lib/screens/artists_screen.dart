import 'package:flutter/material.dart';
import 'package:home_work_7/functions/any_functions.dart';
import 'package:home_work_7/widgets/drawer_widget.dart';
import 'package:home_work_7/models/artist.dart';

class ArtistsScreen extends StatefulWidget {
  static const routeName = '/artists';
  ArtistsScreen({Key? key}) : super(key: key);

  @override
  _ArtistsScreenState createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  List<Artist>? artists;
  Object? error;

  void loadData() async {
    try {
      var artistLoad = await getArtists();
      setState(() {
        artists = artistLoad;
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
    Widget content;

    final List<Artist>? artist = artists;

    if (artist != null)
      content = artistsList(context, artist);
    else
      content = Text('Загрузка данных...');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Артисты'),
      ),
      drawer: ReusebleDrawer(),
      body: SafeArea(
        child: Center(child: content),
      ),
    );
  }
}

Widget artistsList(BuildContext context, List<Artist> artists) {
  return ListView.builder(
    itemCount: artists.length,
    itemBuilder: (context, index) => GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(convertToTitleCase(artists[index].name)),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
            '/about_artist/' + artists[index].link + '/' + index.toString());
      },
    ),
  );
}
