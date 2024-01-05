import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:ricky/model/rick_model.dart';

import '../view/karakter_detail_page.dart';
import 'karakter_datail_view_model.dart';

class MainViewModel with ChangeNotifier {
  final String _apiUrl = "https://rickandmortyapi.com/api/character";

  List<Karakter> _karakterler = [];

  List<Karakter> get karakterler => _karakterler;

  MainViewModel() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _getKarakterler();
    });
  }

  Future<void> _getKarakterler() async {
    Uri uri = Uri.parse(_apiUrl);
    http.Response response = await http.get(uri);

    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> characters = data['results'];

    for (Map<String, dynamic> characterMap in characters) {
      Karakter character = Karakter.frommap(characterMap);
      _karakterler.add(character);
    }
    notifyListeners();
  }

  void karakterClicked(BuildContext context, Karakter karakter) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => KarakterDetailViewModel(),
        child: KarakterDetailPage(),
      ),
    );
    Navigator.push(context, pageRoute);
  }
}
