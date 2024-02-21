import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/appdata_provider.dart';
import 'models/draggablepage.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appdataProvider = Provider.of<AppDataProvider>(context);

   
    return SafeArea(
      child: Scaffold(
        body: PageView(
          children: <Widget>[
            DraggablePage(appdataProvider: appdataProvider, position1: appdataProvider.positions[0], position2: appdataProvider.positions[1], index1: 0, index2: 1),
            DraggablePage(appdataProvider: appdataProvider, position1: appdataProvider.positions[2], position2: appdataProvider.positions[3], index1: 2, index2: 3),
            DraggablePage(appdataProvider: appdataProvider, position1: appdataProvider.positions[4], position2: appdataProvider.positions[5], index1: 4, index2: 5),
           
          ],
        ),
      ),
    );
  }


}

