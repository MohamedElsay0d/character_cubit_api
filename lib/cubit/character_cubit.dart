import 'package:bloc/bloc.dart';
import 'package:character_cubit_api/Data/repositry/breakingbad_repo.dart';
import 'package:meta/meta.dart';

import '../Data/models/Character.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final BreakingbadRepo breakingbadRepo;
  final List<Character> characters = [];
  CharacterCubit(this.breakingbadRepo) : super(CharacterInitial());

  List<Character> getCharacters() {
    breakingbadRepo.getCharacters().then((value) {
      characters.addAll(value);
      emit(CharacterLoaded(characters));
    });
    return characters;
  }
}
