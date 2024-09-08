import 'package:character_cubit_api/Data/models/Character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/character_cubit.dart';

class Charactersscreen extends StatefulWidget {
  const Charactersscreen({super.key});

  @override
  State<Charactersscreen> createState() => _CharactersscreenState();
}

class _CharactersscreenState extends State<Charactersscreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterLoaded) {
            final characters = state.characters;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  title: Text(character.name ?? 'has no name'),
                  subtitle: Text(character.status ?? 'has no status'),
                  leading: Image.network(character.image ?? 'has no image'),
                );
              },
            );
          } else if (state is CharacterError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
