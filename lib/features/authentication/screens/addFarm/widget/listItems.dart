import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {
  final String title;
  final String subtitle;
  const ListItems({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward_ios),
        onPressed: () {},
      ),
    );
  }
}
