import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String placeholder;
  final Function(String) onSearch;

  const SearchWidget({
    required this.placeholder,
    required this.onSearch,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFb3b7c0),
                ),
              ),
              style: const TextStyle(
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
              String searchTerm = _searchController.text;
              widget.onSearch(searchTerm);
            },
          ),
        ],
      ),
    );
  }
}
