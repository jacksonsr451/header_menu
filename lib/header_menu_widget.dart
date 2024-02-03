import 'package:flutter/material.dart';
import 'package:header_menu/components/dropdown_widget.dart';
import 'package:header_menu/components/notification_widget.dart';
import 'package:header_menu/components/search_widget.dart';

class HeaderMenuWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double space = 1.0 * 5;

    return Container(
      height: kToolbarHeight + 30,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 10,
        right: 10,
      ),
      margin: EdgeInsets.only(top: space, right: space),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SearchWidget(),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  NotificationWidget(),
                  SizedBox(
                    width: 20,
                  ),
                  VerticalDivider(
                    color: Color(0xFFb3b7c0),
                    width: 2.0,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropDownWidget(
                    username: "Jackson",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
