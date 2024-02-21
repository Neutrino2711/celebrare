import 'package:flutter/material.dart';
import 'models/draggablepage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          children:
              List.generate(3, (index) => DraggablePage(pageNumber: index)),
        ),
      ),
    );
  }
}
