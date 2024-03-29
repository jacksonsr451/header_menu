import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  final VoidCallback message;
  final VoidCallback notification;

  const NotificationWidget({
    Key? key,
    required this.message,
    required this.notification,
  }) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.message,
            child: Icon(
              Icons.mail,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.notification,
            child: Icon(
              Icons.notification_add,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
        ),
      ],
    );
  }
}
