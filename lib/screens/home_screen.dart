import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/coffee_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Consumer<CoffeeProvider>(
        builder: (context, coffeeProvider, _) {
          if (coffeeProvider == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (coffeeProvider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (coffeeProvider.coffees.isEmpty) {
            return Center(
              child: Text('No coffees found'),
            );
          }
          return ListView.builder(
            itemCount: coffeeProvider.coffees.length,
            itemBuilder: (context, index) {
              final coffee = coffeeProvider.coffees[index];
              return ListTile(
                title: Text(coffee.name ?? ''),
                subtitle: Text(coffee.description ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
