import 'package:flutter/material.dart';

class ItogiInputov extends StatelessWidget {
  const ItogiInputov({Key? key, required this.name, required this.count})
      : super(key: key);
  final String name;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(count > 0 ? '$name ($count)' : '$name'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('1 час'),
            SizedBox(
              width: 30,
            ),
            Text(count > 0 ? '${count * 500}сом' : '1000сом')
          ],
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
