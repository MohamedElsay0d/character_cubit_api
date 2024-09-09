import 'package:character_cubit_api/Data/models/Character.dart';
import 'package:character_cubit_api/pressentation/widgets/no_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../constant/Colors.dart';
import '../../cubit/character_cubit.dart';
import '../widgets/body_all_character_screen.dart';

class Charactersscreen extends StatefulWidget {
  const Charactersscreen({super.key});

  @override
  State<Charactersscreen> createState() => _CharactersscreenState();
}

class _CharactersscreenState extends State<Charactersscreen> {
  late List<Character> allCharacters;
  List<Character> searchedCharacters = [];
  bool isSearching = false;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getCharacters();
  }

  Widget _buildSearchField() {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Search any character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Mycolors.gray),
      ),
      onChanged: (value) {
        _buildAddSearchedItemToSearchedList(value);
      },
    );
  }

  void _buildAddSearchedItemToSearchedList(String value) {
    searchedCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(value.toLowerCase()))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          icon: const Icon(
            Icons.clear,
            color: Mycolors.gray,
          ),
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Mycolors.gray,
          ),
          onPressed: () {
            _startSearch();
          },
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      isSearching = false;
    });
    _clearSearch();
  }

  void _clearSearch() {
    setState(() {
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mycolors.yellow,
        title: isSearching
            ? _buildSearchField()
            : const Text(
                'Characters',
                style: TextStyle(color: Mycolors.gray),
              ),
        actions: _buildAppBarActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget? child,
        ) {
          final bool connected = connectivity.isNotEmpty &&
              connectivity.last != ConnectivityResult.none;
          if (connected) {
            return BlocBuilder<CharacterCubit, CharacterState>(
              builder: (context, state) {
                if (state is CharacterLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CharacterLoaded) {
                  allCharacters = state.characters;
                  return BodyofAllCharacterScreen(
                    controller: controller,
                    allCharacters: allCharacters,
                    searchedCharacters: searchedCharacters,
                  );
                } else if (state is CharacterError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return const Center(child: Text('No data available'));
              },
            );
          } else {
            return const NoInternetConnection();
          }
        },
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
/*
      BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterLoaded) {
            allCharacters = state.characters;
            return BodyofAllCharacterScreen(
                controller: controller,
                allCharacters: allCharacters,
                searchedCharacters: searchedCharacters);
          } else if (state is CharacterError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('No data available'));
        },
      ),
      */