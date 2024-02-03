import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF333954),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 350,
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              top: 2,
              bottom: 2,
            ),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search Courses',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFb3b7c0),
                ),
              ),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFFb3b7c0),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 24.0,
              color: Color(0xFFb3b7c0),
            ),
            onPressed: () {
              // Implemente a lógica de pesquisa aqui
            },
          ),
        ],
      ),
    );
  }
}
