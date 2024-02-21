import 'package:celebrare_assignment/providers/textstate.dart';
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
        if (appdataProvider.selectedId != -1) {
          TextModel textModel =
              appdataProvider.getText(appdataProvider.selectedId);
          appdataProvider.updateText(
              textModel.id, textModel.copyWith(fontColor: customColor));
        }
        // appdataProvider.set_font_color(customColor,0);
        // appdataProvider.addTask(
        //     appdataProvider.getText(0),
        //     appdataProvider.getFontFamily(0),
        //     appdataProvider.getFontColor(0),
        //     appdataProvider.getFontSize(0),
        //     appdataProvider.get_position(0),
        //     appdataProvider.getIdx,
        //     );
        Navigator.pop(context);
      },
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(customColor),
      ),
    );
  }
}
