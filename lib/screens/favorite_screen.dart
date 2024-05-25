import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';
import '../models/jenis_kopi.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<JenisKopi> favorites = Provider.of<FavoriteProvider>(context).favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final JenisKopi coffee = favorites[index];
          return ListTile(
            title: Text(coffee.name!),
            subtitle: Text(coffee.description!),
          );
        },
      ),
    );
  }
}
