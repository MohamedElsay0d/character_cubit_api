import 'package:character_cubit_api/constant/Colors.dart';
import 'package:flutter/material.dart';

import '../../Data/models/Character.dart';
import '../widgets/custom_divider.dart';
import '../widgets/sliver_appbar.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;
  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.gray,
      body: CustomScrollView(slivers: [
        CustomSliverAppBar(character: character),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID :   ${character.id}',
                      style: const TextStyle(
                          color: Mycolors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const CustomDivider(),
                    Text(
                      'Status :   ${character.status}',
                      style: const TextStyle(
                          color: Mycolors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const CustomDivider(),
                    Text(
                      'Gender :   ${character.gender}',
                      style: const TextStyle(
                          color: Mycolors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const CustomDivider(),
                    Text(
                      'Location :   ${character.location}',
                      style: const TextStyle(
                          color: Mycolors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const CustomDivider(),
                    Text(
                      'Episodes :   ${character.episode.length}',
                      style: const TextStyle(
                          color: Mycolors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const CustomDivider(),
                    const Divider(
                      thickness: 0,
                      height: 390,
                      color: Mycolors.gray,
                    )
                  ]))
        ]))
      ]),
    );
  }
}
