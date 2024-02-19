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
            appdataprovider.get_text,
            appdataprovider.get_font_family,
            appdataprovider.get_font_color,
            appdataprovider.get_font_size,
            appdataprovider.get_position);
      },
    );
  }
}
