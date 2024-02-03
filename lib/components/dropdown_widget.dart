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
        if (imagePath != null) ImageIcon(AssetImage(imagePath!)),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}

class DropDownWidget extends StatefulWidget {
  final String username;
  final String? pathImage;

  const DropDownWidget({
    required this.username,
    this.pathImage,
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
    _selectedItem = "1";
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
          if (widget.pathImage != null)
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
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFb3b7c0),
                ),
                value: _selectedItem,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFFb3b7c0),
                ),
                iconSize: 24,
                elevation: 16,
                isExpanded: true,
                underline: Container(
                  height: 2,
                  color: const Color(0xFFb3b7c0),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: '1',
                    child: CustomDropDownMenuItem(
                      value: '1',
                      text: widget.username,
                    ),
                  ),
                  const DropdownMenuItem<String>(
                    value: '2',
                    child: CustomDropDownMenuItem(
                      value: '2',
                      text: 'Outra ação',
                    ),
                  ),
                  const DropdownMenuItem<String>(
                    value: '3',
                    child: CustomDropDownMenuItem(
                      value: '3',
                      text: 'Alguma coisa aqui',
                    ),
                  ),
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
}
