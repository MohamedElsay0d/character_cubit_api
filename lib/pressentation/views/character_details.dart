import 'package:character_cubit_api/constant/Colors.dart';
import 'package:flutter/material.dart';

import '../../Data/models/Character.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;
  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.gray,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 600,
          pinned: true,
          backgroundColor: Mycolors.gray,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              character.name,
              style: const TextStyle(
                  color: Mycolors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            background: Hero(
                tag: character.id,
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ]),
    );
  }
}
