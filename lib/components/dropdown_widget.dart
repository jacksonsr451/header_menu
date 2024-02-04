import 'package:flutter/material.dart';

class CustomDropDownMenuItem<T> extends StatelessWidget {
  final T value;
  final String text;
  final String? imagePath;

  const CustomDropDownMenuItem({
    super.key,
    required this.value,
    required this.text,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (imagePath != null && imagePath!.isNotEmpty)
          ImageIcon(AssetImage(imagePath!)),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}

class DropDownWidget extends StatefulWidget {
  final String username;
  final String? pathImage;
  final List<Map<String, dynamic>> items;

  const DropDownWidget({
    required this.username,
    this.pathImage,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  late String _selectedItem;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _selectedItem =
        widget.items.isNotEmpty ? widget.items.first['value'].toString() : '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      width: 200,
      child: Row(
        children: [
          if (widget.pathImage != null && widget.pathImage!.isNotEmpty)
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              height: MediaQuery.of(context).size.height * 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: ImageIcon(
                  AssetImage(
                    widget.pathImage!,
                  ),
                ),
              ),
            ),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                value: _selectedItem,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                iconSize: 24,
                elevation: 16,
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: '1',
                    child: CustomDropDownMenuItem(
                      value: '1',
                      text: widget.username,
                    ),
                  ),
                  ...generateDropdownItems(widget.items),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue ?? '';
                  });
                },
                onTap: () {
                  setState(() {
                    _isDropdownOpen = !_isDropdownOpen;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> generateDropdownItems(
      List<Map<String, dynamic>> items) {
    int value = 2;
    return items.map((item) {
      final String itemValue = value.toString();
      value++;
      return DropdownMenuItem<String>(
        value: itemValue,
        onTap: item["action"],
        child: CustomDropDownMenuItem(
          value: item["value"].toString(),
          text: item["text"] as String,
        ),
      );
    }).toList();
  }
}
