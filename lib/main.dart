import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'providers/appdata_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppDataProvider(),
      child: MaterialApp(home: Celebrare())));
}
