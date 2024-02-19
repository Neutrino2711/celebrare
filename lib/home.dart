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
                  appdataProvider.font_size = taskState!.fontSize;
                  appdataProvider.font_family = taskState!.fontFamily;
                  appdataProvider.font_color = taskState!.color;
                  appdataProvider.position = taskState!.position;
                  appdataProvider.text = taskState!.text;
                },
                child: Text('Undo'),
              ),
              ElevatedButton(
                onPressed: () {
                  taskState = appdataProvider.redo();
                  appdataProvider.font_size = taskState!.fontSize;
                  appdataProvider.font_family = taskState!.fontFamily;
                  appdataProvider.font_color = taskState!.color;
                  appdataProvider.position = taskState!.position;
                  appdataProvider.text = taskState!.text;
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
                  value: appdataProvider.get_font_size,
                  items: fontSizes.map<DropdownMenuItem<int>>((int val) {
                    return DropdownMenuItem<int>(
                      value: val,
                      child: Text(val.toString()),
                    );
                  }).toList(),
                  onChanged: (val) {
                    appdataProvider.set_font_size(val!);
                    appdataProvider.addTask(
                        appdataProvider.get_text,
                        appdataProvider.get_font_family,
                        appdataProvider.get_font_color,
                        appdataProvider.get_font_size,
                        appdataProvider.get_position);
                  }),
              Spacer(),
              DropdownButton(
                  value: appdataProvider.get_font_family,
                  items: fontsList.map<DropdownMenuItem<String>>((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  onChanged: (val) {
                    appdataProvider.set_font_family(val!);
                    appdataProvider.addTask(
                        appdataProvider.get_text,
                        appdataProvider.get_font_family,
                        appdataProvider.get_font_color,
                        appdataProvider.get_font_size,
                        appdataProvider.get_position);
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
                  appdataProvider.get_font_color),
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
                  appdataProvider.add_text(textcontroller.text);
                  appdataProvider.addTask(
                      appdataProvider.get_text,
                      appdataProvider.get_font_family,
                      appdataProvider.get_font_color,
                      appdataProvider.get_font_size,
                      appdataProvider.get_position);
                },
                child: const Text('Add Text'),
              ),
              ElevatedButton(
                onPressed: () {
                  appdataProvider.replace_text(textcontroller.text);
                  appdataProvider.addTask(
                      appdataProvider.get_text,
                      appdataProvider.get_font_family,
                      appdataProvider.get_font_color,
                      appdataProvider.get_font_size,
                      appdataProvider.get_position);
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
