import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/jenis_kopi.dart';

class ApiService {
  static const String _baseUrl = 'https://fake-coffee-api.vercel.app/api';

  static Future<List<JenisKopi>> fetchCoffees() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((coffee) => JenisKopi.fromJson(coffee)).toList();
    } else {
      throw Exception('Failed to load coffees');
    }
  }
}
