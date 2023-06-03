import 'package:flutter/material.dart';

class Profile2Page extends StatelessWidget {
  const Profile2Page({super.key});
  static const int itemCount = 20;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return  ListTile(
            title: Text('Item ${(index + 1)}'),
            leading: const Icon(Icons.person),
            trailing: const Icon(Icons.select_all),
            onTap: () => debugPrint('tap on person ${(index)}'),
          );
        });
  }
}
