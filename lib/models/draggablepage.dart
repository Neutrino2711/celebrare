import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/appdata_provider.dart';

class DraggablePage extends StatelessWidget {
   DraggablePage({
    super.key,
    required this.appdataProvider,
    required this.position1,
    required this.position2,
    required this.index1,
    required this.index2,
  });

  final AppDataProvider appdataProvider;
  final  Offset position1;
  final  Offset position2;
  final int index1;
  final int index2;

  void dragEnd(DraggableDetails details, BoxConstraints constraints) {
       var loc = Offset( 
                      details.offset.dx.clamp(0, constraints.maxWidth - 75),
                      details.offset.dy.clamp(0, constraints.maxHeight - 75),
                    );
                    appdataProvider.set_position(loc,index2);
                     appdataProvider.addTask(
                        appdataProvider.getText(index2),
                        appdataProvider.getFontFamily(index2),
                        appdataProvider.getFontColor(index2),
                        
                        appdataProvider.getFontSize(index2),
                        position2,
                        index2,
                    );
  }
  


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
            appdataProvider.updateConstraints(constraints);
          });
        return Stack(
          children: appdataProvider.stackWidgets,
        //   children: <Widget>[
        //     Positioned.fill(
        //     child: Image.asset(
        //       'assets/background.jpg', 
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        //   TextWidget(appdataProvider: appdataProvider, position1: position1, position2: position2, index1: index1, index2: index2, constraints: constraints, dragEnd: dragEnd)
        //     // NewText(position1, appdataProvider, index1, constraints),
        //     // NewText(position2, appdataProvider, index2, constraints),
        //     // NewText(Offset(200,200), appdataProvider, index2, constraints),
            
        //   ],
        );
      },
    );
  }
}



class TextWidget extends StatelessWidget {
  const TextWidget({
    
    required this.appdataProvider,
    required this.position1,
    required this.position2,
    required this.index1,
    required this.index2,
    required this.constraints,
    required this.dragEnd,
    });

  final AppDataProvider appdataProvider;
  final   Offset position1;
  final   Offset position2;
  final int index1;
  final int index2;
  final BoxConstraints constraints;
  final void Function(DraggableDetails,BoxConstraints) dragEnd;

  @override
  Widget build(BuildContext context) {
    return
     Positioned(
              left: position2.dx,
              top: position2.dy,
              child: GestureDetector(
               onTap: () {
                  appdataProvider.setIndx(index2);
                  // appdataProvider.set_selected(true);

                  print(appdataProvider.getIdx);
                  print("yeah text 2");
                },
                child: appdataProvider.getIdx == index2 ? Draggable(
                  feedback: Material(
                    color: Colors.transparent,
                    child: Text(
                      appdataProvider.getText(index2),
                      style: TextStyle(
                        fontSize: appdataProvider.getFontSize(index2).toDouble(),
                        color: appdataProvider.getIdx == index2? Colors.black: appdataProvider.getFontColor(index2),
                        fontFamily: appdataProvider.getFontFamily(index2),
                      ),
                    ),
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (details) => dragEnd(details, constraints),
                  
                  child: Text(
                    appdataProvider.getText(index2),
                    style: TextStyle(
                      fontSize: appdataProvider.getFontSize(index2).toDouble(),
                      color: appdataProvider.getIdx == index2? Colors.black:appdataProvider.getFontColor(index2),
                      fontFamily: appdataProvider.getFontFamily(index2),
                    ),
                  ),
                ):Text(
                    appdataProvider.getText(index2),
                    style: TextStyle(
                      fontSize: appdataProvider.getFontSize(index2).toDouble(),
                      color: appdataProvider.getFontColor(index2),
                      fontFamily: appdataProvider.getFontFamily(index2),
                    ),
                  ),
              ),
            );
     
     }
}