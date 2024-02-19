import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/appdata_provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appdataProvider = Provider.of<AppDataProvider>(context);

    Offset position = appdataProvider.get_position;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: <Widget>[
              Positioned(
                left: position.dx,
                top: position.dy,
                child: Draggable(
                  feedback: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          
                          Text(
                            appdataProvider.get_text,
                            style: TextStyle(
                              fontSize: appdataProvider.get_font_size.toDouble(),
                              color: appdataProvider.get_font_color,
                              fontFamily: appdataProvider.get_font_family,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (details) {
                    position = Offset(
                      details.offset.dx.clamp(0, constraints.maxWidth - 50),
                      details.offset.dy.clamp(0, constraints.maxHeight - 50),
                    );
                    appdataProvider.set_position(position);
                    appdataProvider.addTask(
                        appdataProvider.get_text,
                        appdataProvider.get_font_family,
                        appdataProvider.get_font_color,
                        appdataProvider.get_font_size,
                        appdataProvider.get_position);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                       
                        Text(
                          appdataProvider.get_text,
                          style: TextStyle(
                            fontSize: appdataProvider.get_font_size.toDouble(),
                            color: appdataProvider.get_font_color,
                            fontFamily: appdataProvider.get_font_family,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
