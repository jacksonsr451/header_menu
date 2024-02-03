import 'package:flutter/material.dart';
import 'package:header_menu/components/dropdown_widget.dart';
import 'package:header_menu/components/notification_widget.dart';
import 'package:header_menu/components/search_widget.dart';

class HeaderMenuWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderMenuWidget({Key? key}) : super(key: key);

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
              return _buildColumnLayout();
            } else {
              return _buildRowLayout();
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

  Widget _buildColumnLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SearchWidget(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildBorder(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: NotificationWidget(),
            ),
            _buildBorder(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DropDownWidget(username: "Jackson"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRowLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SearchWidget(),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              _buildBorder(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: NotificationWidget(),
              ),
              _buildBorder(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DropDownWidget(username: "Jackson"),
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
