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
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: [
          Row(
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
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 24.0,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                onPressed: () {
                  String searchTerm = _searchController.text;
                  widget.onSearch(searchTerm);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
