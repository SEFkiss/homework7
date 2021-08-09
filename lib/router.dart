import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:home_work_7/screens/about_artist_screen.dart';
import 'package:home_work_7/screens/artists_screen.dart';
import 'package:home_work_7/screens/home_screen.dart';

class FluroRouter {
  static fluro.FluroRouter router = fluro.FluroRouter();
  // Обработчик HomeScreen
  static final fluro.Handler _homeHandler = fluro.Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomeScreen();
  });
  // Обработчик AboutArtistScreen
  static final fluro.Handler _artistsHandler = fluro.Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ArtistsScreen();
  });
  // Обработчик ArtistsScreen
  static final fluro.Handler _aboutArtistHandler = fluro.Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return AboutArtistsScreen(
      link: params.containsKey('link') ? params['link'][0].toString() : '',
      index: params.containsKey('index') ? int.parse(params['index'][0]) : 0,
    );
  });

// Инициализация роутов, с анимэйшином
  static void setupRouter() {
    router.define(
      HomeScreen.routeName,
      handler: _homeHandler,
      transitionType: fluro.TransitionType.fadeIn,
    );
    router.define(
      ArtistsScreen.routeName,
      handler: _artistsHandler,
      transitionType: fluro.TransitionType.cupertino,
    );
    router.define(
      '${AboutArtistsScreen.routeName}/:link/:index',
      handler: _aboutArtistHandler,
      transitionType: fluro.TransitionType.fadeIn,
    );
  }
}
