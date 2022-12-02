import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/pokemon.dart';

class FavoriteListState extends ChangeNotifier {
  final List<Result> _favoriteList = [];
  List<Result> get favoriteList => _favoriteList;

  void toggleFavorite(Result pokemon) {
    if (isExist(pokemon)) {
      _favoriteList.removeWhere((item) => item.name == pokemon.name);
    } else {
      _favoriteList.add(pokemon);

    }
    notifyListeners();
  }

  bool isExist(Result pokemon) {
    // final isExist = _favoriteList[0]..contains(pokemon.name);
    for (var i = 0; i < _favoriteList.length; i++) {
      if (_favoriteList[i].name == pokemon.name) {
        //  _favoriteList[i]
        return true;
      }
    }
    return false;
  }

  static FavoriteListState of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteListState>(
      context,
      listen: listen,
    );
  }

  // List<FavouritePokemon> favouritePokemonList = [];

  // addToFavorites(FavouritePokemon favouritePokemon) {
  //   favouritePokemonList.add(favouritePokemon);
  //   notifyListeners();
  // }

  // deleteFromFavourites(int pokemonId) {
  //   for (var i = 0; i < favouritePokemonList.length; i++) {
  //     if (pokemonId == favouritePokemonList[i].id) {
  //       favouritePokemonList.removeAt(i);
  //       break;
  //     }
  //   }
  //   notifyListeners();
  // }
}