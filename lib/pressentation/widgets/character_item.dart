import 'package:character_cubit_api/Data/models/Character.dart';
import 'package:character_cubit_api/constant/Colors.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  Character character;
  CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Mycolors.white, borderRadius: BorderRadius.circular(8)),
        child: GridTile(
            footer: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Mycolors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            child: GestureDetector(
                /*
          onTap: () {
            Navigator.pushNamed(context, characterDetailsScreen,
                arguments: character);
          },
          */
                child: Container(
              color: Mycolors.gray,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading_image.gif',
                      image: character.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/error_image.gif'),
            ))));
  }
}
