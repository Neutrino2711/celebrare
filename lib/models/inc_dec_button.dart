import 'package:flutter/material.dart';

import '../providers/appdata_provider.dart';

class IncDecButton extends StatelessWidget {
  const IncDecButton({
    super.key,
    required this.appdataprovider,
    required this.op,
    required this.icon,
  });

  final AppDataProvider appdataprovider;
  final void Function()? op;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        op!();
        appdataprovider.addTask(
            appdataprovider.getText(0),
            appdataprovider.getFontFamily(0),
            appdataprovider.getFontColor(0),
            appdataprovider.getFontSize(0),
            appdataprovider.get_position(0),
            appdataprovider.getIdx,);
      },
    );
  }
}
