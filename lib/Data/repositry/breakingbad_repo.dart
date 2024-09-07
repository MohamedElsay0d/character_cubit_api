import 'package:character_cubit_api/Data/models/Character.dart';

import '../web_services/breakingbad_api.dart';

class BreakingbadRepo {
  final BreakingBadApi breakingBadApi;
  BreakingbadRepo({required this.breakingBadApi});
  Future<List<Character>> getCharacters() async {
    final response = await breakingBadApi.getCharacters();
    return response.map((e) => Character.fromJson(e)).toList();
  }
}
