import 'package:flutter/material.dart';

class Karakter with ChangeNotifier{
  int id;
  String name;
  String status;
  String species;
  String gender;
  String image;


  Karakter.frommap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'] ?? "",
        status = map['status'] ?? "",
        species = map['species'] ?? "",
        gender = map['gender'] ?? "",
        image = map['image'] ?? "";

  }