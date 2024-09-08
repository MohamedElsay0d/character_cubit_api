import 'package:character_cubit_api/Data/repositry/breakingbad_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Data/web_services/breakingbad_api.dart';
import 'constant/Strings.dart';
import 'cubit/character_cubit.dart';
import 'pressentation/views/CharactersScreen.dart';
import 'pressentation/views/character_details.dart';

class AppRoute {
  late BreakingbadRepo breakingbadRepo;
  late CharacterCubit characterCubit;

  AppRoute() {
    breakingbadRepo = BreakingbadRepo(breakingBadApi: BreakingBadApi());
    characterCubit = CharacterCubit(breakingbadRepo);
  }
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => characterCubit,
                  child: const Charactersscreen(),
                ));
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharacterDetails());
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
