import 'package:flutter/material.dart';
import 'package:header_menu/header_menu_widget.dart';

void main() {
  Map<String, dynamic> headerMap = {
    "notifications": {
      "message": () => {},
      "notification": () => {},
    },
    "dropdown": {
      "username": "Jackson",
      "imagePath": "",
      "items": [
        {
          "value": "1",
          "action": () => {},
          "text": "First",
        }
      ],
    },
    "search": {
      "placeholder": 'Search Courses',
      "action": (String text) => {
            print(text),
          },
    }
  };

  runApp(
    MaterialApp(
      home: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 255,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text("Menu"),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderMenuWidget(
                    headerMap: headerMap,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: const Text("Content"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
