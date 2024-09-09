import 'package:flutter/material.dart';
import 'package:character_cubit_api/Data/models/Character.dart';
import 'package:character_cubit_api/pressentation/widgets/character_item.dart';

class BodyofAllCharacterScreen extends StatelessWidget {
  const BodyofAllCharacterScreen({
    super.key,
    required this.controller,
    required this.allCharacters,
    required this.searchedCharacters,
  });

  final TextEditingController controller;
  final List<Character> allCharacters;
  final List<Character> searchedCharacters;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 6,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: controller.text.isEmpty
                  ? allCharacters.length
                  : searchedCharacters.length,
              itemBuilder: (context, index) {
                return CharacterItem(
                  character: controller.text.isEmpty
                      ? allCharacters[index]
                      : searchedCharacters[index],
                );
              }),
        ],
      ),
    );
  }
}
