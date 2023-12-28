import 'dart:convert';
import 'package:e_commerce/splash.dart';
import 'package:http/http.dart' as httpClient;
import 'package:e_commerce/model/itemmodel.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),home: Splash(),
    );
  }
}

Future<List<ItemModel>> getItemList() async {
  var mUrl = 'https://fakestoreapi.com/products';

  try {
    var response = await httpClient.get(Uri.parse(mUrl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<ItemModel> itemList = List.from(data.map((item) => ItemModel.fromJson(item)));
      return itemList;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
    rethrow;
  }
}
