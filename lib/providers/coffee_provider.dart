import 'package:flutter/material.dart';
import '../models/jenis_kopi.dart';
import '../services/api_service.dart';

class CoffeeProvider extends ChangeNotifier {
  List<JenisKopi> _coffees = [];
  bool _isLoading = false;

  List<JenisKopi> get coffees => _coffees;
  bool get isLoading => _isLoading;

  CoffeeProvider() {
    fetchCoffees();
  }

  Future<void> fetchCoffees() async {
    _isLoading = true;
    notifyListeners();
    _coffees = await ApiService.fetchCoffees();
    _isLoading = false;
    notifyListeners();
  }

  void searchCoffees(String query) {
    if (query.isEmpty) {
      fetchCoffees();
    } else {
      _coffees = _coffees
          .where((coffee) =>
      coffee.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
      notifyListeners();
    }
  }
}
