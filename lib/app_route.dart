import 'package:flutter/material.dart';

import 'constant/Strings.dart';
import 'pressentation/views/CharactersScreen.dart';
import 'pressentation/views/character_details.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => const Charactersscreen());
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharacterDetails());
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
