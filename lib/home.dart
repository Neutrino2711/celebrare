import 'dart:ffi';

import 'package:flutter/material.dart';

import 'drag.dart';
import 'num_inc_dec.dart';
import 'color_palette.dart';

import 'package:provider/provider.dart';
import '../providers/appdata_provider.dart';
import 'providers/operation.dart';

class Celebrare extends StatelessWidget {
  Celebrare({super.key});

  final List<String> fontsList = [
    'Roboto',
    'DancingScript',
    'Workbench',
  ];

  final List<int> fontSizes = [
    10,
    20,
    30,
    40,
    50,
  ];

  TextEditingController textcontroller = TextEditingController();
  TaskState? taskState;

  @override
  Widget build(BuildContext context) {

    String dropdownVal = fontSizes.first.toString();
    final appdataProvider = Provider.of<AppDataProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MyHomePage()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  taskState = appdataProvider.undo();
                  // print(taskState!.index);
                  // appdataProvider.selectedIndx = taskState!.index;
                  appdataProvider.font_sizes[taskState!.index] = taskState!.fontSize;
                  appdataProvider.font_families[taskState!.index] = taskState!.fontFamily;
                  appdataProvider.font_colors[taskState!.index] = taskState!.color;
                  appdataProvider.positions[taskState!.index] = taskState!.position;
                  appdataProvider.texts[taskState!.index] = taskState!.text;
                  
                },
                child: Text('Undo'),
              ),
              ElevatedButton(
                onPressed: () {
                  taskState = appdataProvider.redo();
                 appdataProvider.selectedIndx = taskState!.index;
                  appdataProvider.font_sizes[appdataProvider.selectedIndx] = taskState!.fontSize;
                  appdataProvider.font_families[appdataProvider.selectedIndx] = taskState!.fontFamily;
                  appdataProvider.font_colors[appdataProvider.selectedIndx] = taskState!.color;
                  appdataProvider.positions[appdataProvider.selectedIndx] = taskState!.position;
                  appdataProvider.texts[appdataProvider.selectedIndx] = taskState!.text;
                },
                child: Text('Redo'),
              ),
            ],
          ),
          // Card(
          //   child: Text("Text"),
          // ),
          // dragWidget.Draggable(),
          Row(
            children: [
              // NumIncDec(),
              DropdownButton(
                  value: appdataProvider.getFontSize(appdataProvider.getIdx),
                  items: fontSizes.map<DropdownMenuItem<int>>((int val) {
                    return DropdownMenuItem<int>(
                      value: val,
                      child: Text(val.toString()),
                    );
                  }).toList(),
                  onChanged: (val) {
                    appdataProvider.set_font_size(val!,0);
                    appdataProvider.addTask(
                        appdataProvider.getText(0),
                        appdataProvider.getFontFamily(0),
                        appdataProvider.getFontColor(0),
                        appdataProvider.getFontSize(0),
                        appdataProvider.get_position(0),
                        appdataProvider.getIdx,);
                  }),
              Spacer(),
              DropdownButton(
                  value: appdataProvider.getFontFamily(appdataProvider.getIdx),
                  items: fontsList.map<DropdownMenuItem<String>>((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  onChanged: (val) {
                    appdataProvider.set_font_family(val!,0);
                    appdataProvider.addTask(
                         appdataProvider.getText(0),
                        appdataProvider.getFontFamily(0),
                        appdataProvider.getFontColor(0),
                        appdataProvider.getFontSize(0),
                        appdataProvider.get_position(0),
                        appdataProvider.getIdx,);
                  }),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ColorPalette();
                  });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  appdataProvider.getFontColor(appdataProvider.getIdx)),
            ),
            child: const Text('Select Color'),
          ),

          // Row(
          //   children: [
          // NumberInputWithIncrementDecrement(
          //     scaleWidth: 0.3, controller: TextEditingController()),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textcontroller,
              style: const TextStyle(
                fontSize: 24,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add Text',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  appdataProvider.add_text(textcontroller.text,0);
                  appdataProvider.addTask(
                       appdataProvider.getText(0),
                        appdataProvider.getFontFamily(0),
                        appdataProvider.getFontColor(0),
                        appdataProvider.getFontSize(0),
                        appdataProvider.get_position(0),
                      appdataProvider.getIdx,
                      );
                },
                child: const Text('Add Text'),
              ),
              ElevatedButton(
                onPressed: () {
                  appdataProvider.replace_text(textcontroller.text);
                  appdataProvider.addTask(
                      appdataProvider.getText(0),
                        appdataProvider.getFontFamily(0),
                        appdataProvider.getFontColor(0),
                        appdataProvider.getFontSize(0),
                        appdataProvider.get_position(0),
                      appdataProvider.getIdx,
                      );
                },
                child: const Text('Replace Text'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
