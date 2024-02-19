import 'package:flutter/material.dart';
import '../providers/appdata_provider.dart';
import 'package:provider/provider.dart';
import '../models/inc_dec_button.dart';

class NumIncDec extends StatelessWidget {
  NumIncDec({super.key});

  @override
  Widget build(BuildContext context) {
    final appdataprovider = Provider.of<AppDataProvider>(context);
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Row(
          children: [
            Text(
              appdataprovider.get_font_size.toString(),
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
            ),
            Column(children: [
              IncDecButton(
                  appdataprovider: appdataprovider,
                  op: appdataprovider.inc_font_size,
                  icon: Icons.add),
              IncDecButton(
                  appdataprovider: appdataprovider,
                  op: appdataprovider.dec_font_size,
                  icon: Icons.remove),
            ]),
          ],
        ));
  }
}
