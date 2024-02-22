import 'package:celebrare_assignment/providers/appdata_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReorderPage extends StatefulWidget {
  const ReorderPage({super.key});

  @override
  State<ReorderPage> createState() => _ReorderPageState();
}

class _ReorderPageState extends State<ReorderPage> {
  final List<int> _items = List.generate(3, (index) => index);

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final int item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
    print(_items);
  }

  @override
  Widget build(BuildContext context) {
    AppDataProvider appdataProvider = Provider.of<AppDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reorder Your Pages'),
      ),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          _onReorder(oldIndex, newIndex);
          appdataProvider.reorderPages(_items);
        },
        children: _items
            .map((int item) => ListTile(
                  key: Key(item.toString()),
                  title: Text('Item ${item + 1}'),
                ))
            .toList(),
      ),
    );
  }
}
