import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(this.title, {Key? key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Navigator.canPop(context)
            ? Icon(Icons.arrow_back_ios)
            : Icon(Icons.menu),
        onPressed: Navigator.canPop(context)
            ? () => Navigator.of(context).pop()
            : () => Scaffold.of(context).openDrawer(),
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
