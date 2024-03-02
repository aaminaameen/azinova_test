
import 'dart:convert';

import 'package:azinova/presentation/style/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemDetailsPage extends StatefulWidget {
  final Map<String, dynamic> item;

  const ItemDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}
class _ItemDetailsPageState extends State<ItemDetailsPage> {
  late List<Map<String, dynamic>> savedItems = [];

  @override
  void initState() {
    super.initState();
    getSavedItems();
  }

  Future<void> getSavedItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? itemsJson = prefs.getString('items');
    if (itemsJson != null) {
      setState(() {
        savedItems = List<Map<String, dynamic>>.from(
            json.decode(itemsJson).map((item) => item as Map<String, dynamic>));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['itemName']!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.item['itemImage']!),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              widget.item['itemDetails']!,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: ColorPalette.black, fontSize: 18),
            ),
          ),
          savedItems.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: savedItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(savedItems[index]['itemName']),
                        subtitle: Text(savedItems[index]['itemDetails']),
                        leading: Image.network(savedItems[index]['itemImage']),
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
