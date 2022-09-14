import 'package:flutter/material.dart';

import '../../Constants/constants.dart';

class SettingsListTile extends StatelessWidget {
  SettingsListTile({
    Key? key,
    required this.title,
    required this.icons,
  }) : super(key: key);

  String title;
  IconData icons;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: primaryColor,
      leading: Icon(
        icons,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 17,
        ),
      ),
    );
  }
}
