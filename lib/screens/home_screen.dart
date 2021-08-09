import 'package:flutter/material.dart';
import 'package:home_work_7/widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Главная'),
      ),
      drawer: ReusebleDrawer(),
      body: SafeArea(
        child: Center(child: Text('Главный экран')),
      ),
    );
  }
}
