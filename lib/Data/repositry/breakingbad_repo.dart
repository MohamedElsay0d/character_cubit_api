import 'package:character_cubit_api/Data/models/Character.dart';

import '../web_services/breakingbad_api.dart';

class BreakingbadRepo {
  Future<List<Character>> getCharacters() async {
    final response = await BreakingBadApi().getCharacters();
    return response.map((e) => Character.fromJson(e)).toList();
  }
}
