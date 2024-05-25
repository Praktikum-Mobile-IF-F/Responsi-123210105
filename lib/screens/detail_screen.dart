import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/jenis_kopi.dart';
import '../providers/favorite_provider.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final JenisKopi coffee = ModalRoute.of(context)!.settings.arguments as JenisKopi;

    return Scaffold(
      appBar: AppBar(
        title: Text(coffee.name!),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(coffee.imageUrl!, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(coffee.name!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(coffee.description!),
            SizedBox(height: 20),
            Text('Price: \$${coffee.price}', style: TextStyle(fontSize: 16)),
            Text('Region: ${coffee.region}', style: TextStyle(fontSize: 16)),
            Text('Weight: ${coffee.weight}g', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Flavor Profile: ${coffee.flavorProfile?.join(', ')}', style: TextStyle(fontSize: 16)),
            Text('Grind Options: ${coffee.grindOption?.join(', ')}', style: TextStyle(fontSize: 16)),
            Text('Roast Level: ${coffee.roastLevel}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<FavoriteProvider>(context, listen: false)
                    .addFavorite(coffee);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${coffee.name} added to favorites')),
                );
              },
              child: Text('Add to Favorite'),
            ),
          ],
        ),
      ),
    );
  }
}
