import 'package:celebrare_assignment/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'providers/appdata_provider.dart';

void main() {
  runApp(
    MultiProvider(
      // create: (context) => AppDataProvider(),
      providers: [
        ChangeNotifierProvider(create: (context) => AppDataProvider()),
        ChangeNotifierProvider(create: (context) => PageProvider()),
      ],
      child: MaterialApp(
        home: Celebrare(),
      ),
    ),
  );
}
