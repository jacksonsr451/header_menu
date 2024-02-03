import 'package:flutter/material.dart';
import 'package:header_menu/components/dropdown_widget.dart';
import 'package:header_menu/components/notification_widget.dart';
import 'package:header_menu/components/search_widget.dart';

class HeaderMenuWidget extends StatelessWidget implements PreferredSizeWidget {
  final Map<String, dynamic> headerMap;

  const HeaderMenuWidget({
    required this.headerMap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2.0 * 5),
      decoration: const BoxDecoration(
        color: Color(0xFF272e4b),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFb3b7c0),
              width: 2.0,
            ),
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final maxWidth = constraints.maxWidth;
            if (maxWidth < 600) {
              return _buildColumnLayout(context);
            } else {
              return _buildRowLayout(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildBorder() {
    return Container(
      height: 24,
      width: 2,
      color: const Color(0xFFb3b7c0),
    );
  }

  Widget _buildColumnLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SearchWidget(
            placeholder: headerMap["search"]["placeholder"],
            onSearch: headerMap["search"]["action"],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildBorder(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: NotificationWidget(
                message: headerMap["notifications"]["message"],
                notification: headerMap["notifications"]["notification"],
              ),
            ),
            _buildBorder(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropDownWidget(
                username: headerMap["dropdown"]["username"],
                pathImage: headerMap["dropdown"]["imagePath"],
                items: headerMap["dropdown"]["items"],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRowLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SearchWidget(
            placeholder: headerMap["search"]["placeholder"],
            onSearch: headerMap["search"]["action"],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              _buildBorder(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: NotificationWidget(
                  message: headerMap["notifications"]["message"],
                  notification: headerMap["notifications"]["notification"],
                ),
              ),
              _buildBorder(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropDownWidget(
                  username: headerMap["dropdown"]["username"],
                  pathImage: headerMap["dropdown"]["imagePath"],
                  items: headerMap["dropdown"]["items"],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
