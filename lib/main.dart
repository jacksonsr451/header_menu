import 'package:flutter/material.dart';
import 'package:header_menu/header_menu_widget.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 245,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text("Menu"),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderMenuWidget(),
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
