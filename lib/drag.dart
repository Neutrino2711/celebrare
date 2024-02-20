import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/appdata_provider.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appdataProvider = Provider.of<AppDataProvider>(context);

   
    return Scaffold(
      body: PageView(
        children: <Widget>[
          buildDraggablePage(appdataProvider, appdataProvider.positions[0], appdataProvider.positions[1],0,1),
          buildDraggablePage(appdataProvider, appdataProvider.positions[2], appdataProvider.positions[3],2,3),
          buildDraggablePage(appdataProvider, appdataProvider.positions[4], appdataProvider.positions[5],4,5),
         
        ],
      ),
    );
  }

  Widget buildDraggablePage(AppDataProvider appdataProvider, Offset position1,Offset position2,int index1,int index2) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: <Widget>[
            Positioned(
              left: position1.dx,
              top: position1.dy,
              child: GestureDetector(
                onDoubleTap: () {
                  appdataProvider.setIndx(index1);
                  // print(appdataProvider.getIdx);
                  print("yeah text 1 ");
                },
                child: Draggable(
                  feedback: Material(
                    color: Colors.transparent,
                    child: Text(
                      appdataProvider.getText(index1),
                      style: TextStyle(
                        fontSize: appdataProvider.getFontSize(index1).toDouble(),
                        color: appdataProvider.getFontColor(index1),
                        fontFamily: appdataProvider.getFontFamily(index1),
                      ),
                    ),
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (details) {
                    position1 = Offset(
                      details.offset.dx.clamp(0, constraints.maxWidth - 75),
                      details.offset.dy.clamp(0, constraints.maxHeight - 75),
                    );
                    appdataProvider.set_position(position1,index1);
                  },
                  child: Text(
                    appdataProvider.getText(index1),
                    style: TextStyle(
                      fontSize: appdataProvider.getFontSize(index1).toDouble(),
                      color: appdataProvider.getFontColor(index1),
                      fontFamily: appdataProvider.getFontFamily(index1),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: position2.dx,
              top: position2.dy,
              child: GestureDetector(
                onDoubleTap: () {
                  appdataProvider.setIndx(index2);
                  print(appdataProvider.getIdx);
                  print("yeah text 2");
                },
                child: Draggable(
                  feedback: Material(
                    color: Colors.transparent,
                    child: Text(
                      appdataProvider.getText(index2),
                      style: TextStyle(
                        fontSize: appdataProvider.getFontSize(index2).toDouble(),
                        color: appdataProvider.getFontColor(index2),
                        fontFamily: appdataProvider.getFontFamily(index2),
                      ),
                    ),
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (details) {
                    position2 = Offset(
                      details.offset.dx.clamp(0, constraints.maxWidth - 75),
                      details.offset.dy.clamp(0, constraints.maxHeight - 75),
                    );
                    appdataProvider.set_position(position2,index2);
                  },
                  child: Text(
                    appdataProvider.getText(index2),
                    style: TextStyle(
                      fontSize: appdataProvider.getFontSize(index2).toDouble(),
                      color: appdataProvider.getFontColor(index2),
                      fontFamily: appdataProvider.getFontFamily(index2),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}