import 'package:celebrare_assignment/providers/textstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/appdata_provider.dart';

class DraggablePage extends StatelessWidget {
  const DraggablePage({
    super.key,
    required this.pageNumber,
  });

  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    final appdataProvider = Provider.of<AppDataProvider>(context);
    final pageTexts = appdataProvider.getPageText(pageNumber);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // WidgetsBinding.instance!.addPostFrameCallback((_) {
        //     appdataProvider.updateConstraints(constraints);
        //   });
        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                'assets/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            ...pageTexts.map(
              (e) => SingleTextWidget(e: e, constraints: constraints),
            ),
          ],
        );
      },
    );
  }
}

class SingleTextWidget extends StatelessWidget {
  const SingleTextWidget({
    super.key,
    required this.e,
    required this.constraints,
  });
  final TextModel e;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final appdataProvider = Provider.of<AppDataProvider>(context);
    return Positioned(
      left: e.position.dx,
      top: e.position.dy,
      child: GestureDetector(
        onTap: () {
          appdataProvider.setSelectedId(e.id);
        },
        child: e.id == appdataProvider.selectedId
            ? Draggable(
                feedback: Material(
                  color: Colors.transparent,
                  child: Text(
                    e.content,
                    style: TextStyle(
                      fontSize: e.fontSize.toDouble(),
                      color: e.id == appdataProvider.selectedId
                          ? Colors.black
                          : e.fontColor,
                      fontFamily: e.fontFamily,
                    ),
                  ),
                ),
                childWhenDragging: Container(),
                onDragEnd: (details) {
                  var loc = Offset(
                    details.offset.dx.clamp(0, constraints.maxWidth - 75),
                    details.offset.dy.clamp(0, constraints.maxHeight - 75),
                  );
                  TextModel textModel =
                      appdataProvider.getText(appdataProvider.selectedId);
                  appdataProvider.updateText(
                      textModel.id, textModel.copyWith(position: loc));
                },
                child: Text(
                  e.content,
                  style: TextStyle(
                    fontSize: e.fontSize.toDouble(),
                    color: e.id == appdataProvider.selectedId
                        ? Colors.black
                        : e.fontColor,
                    fontFamily: e.fontFamily,
                  ),
                ),
              )
            : Text(
                e.content,
                style: TextStyle(
                  fontSize: e.fontSize.toDouble(),
                  color: e.fontColor,
                  fontFamily: e.fontFamily,
                ),
              ),
      ),
    );
  }
}
