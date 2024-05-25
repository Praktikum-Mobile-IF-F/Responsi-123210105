import 'package:flutter/material.dart';
import '../models/jenis_kopi.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<JenisKopi> _favorites = [];

  List<JenisKopi> get favorites => _favorites;

  void addFavorite(JenisKopi coffee) {
    _favorites.add(coffee);
    notifyListeners();
  }

  void removeFavorite(String coffeeId) {
    _favorites.removeWhere((coffee) => coffee.id == coffeeId);
    notifyListeners();
  }
}
