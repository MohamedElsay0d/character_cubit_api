import 'package:bloc/bloc.dart';
import 'package:character_cubit_api/Data/repositry/breakingbad_repo.dart';
import 'package:meta/meta.dart';

import '../Data/models/Character.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final BreakingbadRepo breakingbadRepo;
  List<Character> characters = [];
  CharacterCubit(this.breakingbadRepo) : super(CharacterInitial());

  List<Character> getCharacters() {
    breakingbadRepo.getCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
