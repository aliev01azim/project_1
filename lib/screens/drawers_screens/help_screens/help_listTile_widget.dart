import 'package:flutter/material.dart';

class HelpListTile extends StatelessWidget {
  const HelpListTile({Key? key, required this.title, required this.page})
      : super(key: key);
  final String title;
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style:
            Theme.of(context).textTheme.caption!.copyWith(color: Colors.black),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right_outlined,
      ),
      onTap: () async {
        await Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => page));
      },
    );
  }
}
