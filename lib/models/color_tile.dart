import 'package:flutter/material.dart';

import '../providers/appdata_provider.dart';

class CustomColorButton extends StatelessWidget {
  const CustomColorButton({
    super.key,
    required this.appdataProvider,
    required this.customColor,
    required this.text,
  });

  final AppDataProvider appdataProvider;
  final Color customColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        appdataProvider.set_font_color(customColor);
        appdataProvider.addTask(
            appdataProvider.get_text,
            appdataProvider.get_font_family,
            appdataProvider.get_font_color,
            appdataProvider.get_font_size,
            appdataProvider.get_position);
        Navigator.pop(context);
      },
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(customColor),
      ),
    );
  }
}
