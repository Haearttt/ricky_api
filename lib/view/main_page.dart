
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricky/view_model/main_view_model.dart';
import 'package:ricky/model/rick_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick and Morty Characters"),
      ),
      body: _buildKarakterList(context),
    );
  }

  Widget _buildKarakterList(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.karakterler.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: viewModel.karakterler[index],
            child: _buildListTile(context),
          );
        },
      ),
    );
  }

  Widget _buildListTile(BuildContext context) {
    MainViewModel viewModel = Provider.of<MainViewModel>(
      context,
      listen: false,
    );
    return Consumer<Karakter>(
      builder: (context, karakter, child) => ListTile(
        title: Text(karakter.name),
        subtitle: Text(karakter.status),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(karakter.image),
        ),
        onTap: () {
          viewModel.karakterClicked(context, karakter);
        },
      ),
    );
  }
}
