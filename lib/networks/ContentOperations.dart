import 'dart:convert';
import 'package:flutter_webview_example/models/Content.dart';
import 'package:http/http.dart' as http;

class ContentOperations{

   String base_url = "192.168.2.36:3000";

   Future<List<Content>> fetchAllContents() async {
    final response = await http.get(new Uri.http(base_url, "/"));
    if (response.statusCode == 200) {
      List<Content> users = new List<Content>();
      users = (json.decode(response.body) as List)
          .map((i) => Content.fromJson(i))
          .toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

}