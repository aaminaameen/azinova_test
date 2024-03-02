import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ItemService {
  static const String itemsKey = 'items';

  Future<List<Map<String, dynamic>>> fetchItems() async {
    final response = await http.get(Uri.parse('https://demo.azinova.me/machine-test/api/get_items'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> itemList = jsonData['items'];
      return itemList.map((item) {
        return {
          'itemName': item['itemName'],
          'itemImage': item['itemImage'],
          'itemDetails': item['itemDetails'],
        };
      }).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<void> saveItemsToSharedPreferences(List<Map<String, dynamic>> items) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(itemsKey, jsonEncode(items));
  }
}
