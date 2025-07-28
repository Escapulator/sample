import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const DrawerTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Color(0XFFAfAfAf)),
    );
  }
}
