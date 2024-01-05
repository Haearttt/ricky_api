import 'package:ricky/model/rick_model.dart';
import 'package:ricky/view_model/karakter_datail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';





class KarakterDetailPage extends StatelessWidget {
  const KarakterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<Karakter>(
          builder: (context, country, child) => Text(country.name),
        ),
      ),
    );
  }
}