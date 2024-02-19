import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/appdata_provider.dart';
import '../models/color_tile.dart';

class ColorPalette extends StatelessWidget {
  const ColorPalette({super.key});

  @override
  Widget build(BuildContext context) {
    final appdataProvider = Provider.of<AppDataProvider>(context);

    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: GridView(
          padding: EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          children: [
            CustomColorButton(
              appdataProvider: appdataProvider,
              customColor: Colors.red,
              text: "Red",
            ),
            CustomColorButton(
              appdataProvider: appdataProvider,
              customColor: Colors.blue,
              text: "Blue",
            ),
            CustomColorButton(
              appdataProvider: appdataProvider,
              customColor: Colors.green,
              text: "Green",
            ),
            CustomColorButton(
              appdataProvider: appdataProvider,
              customColor: Colors.pink,
              text: "Pink",
            ),
            CustomColorButton(
              appdataProvider: appdataProvider,
              customColor: Colors.cyan,
              text: "Cyan",
            ),
            CustomColorButton(
              appdataProvider: appdataProvider,
              customColor: Colors.amber,
              text: "Amber",
            ),
            CustomColorButton(
              appdataProvider: appdataProvider,
              customColor: Colors.yellow,
              text: "Yellow",
            ),
            CustomColorButton(
              appdataProvider: appdataProvider,
              customColor: Colors.purple,
              text: "Purple",
            ),
          ],
        ));
  }
}
