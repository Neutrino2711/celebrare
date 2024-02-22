import 'package:celebrare_assignment/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'models/draggablepage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,required this.pageProvider});
  final PageProvider pageProvider;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      // print(_pageController.page);
      if (_pageController.page!.toInt() == _pageController.page) {
        // print('Page Number: ${_pageController.page!.toInt()}');
        widget.pageProvider.currentPage = _pageController.page!.toInt();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children:
              List.generate(3, (index) => DraggablePage(pageNumber: index)),
        ),
      ),
    );
  }
}
