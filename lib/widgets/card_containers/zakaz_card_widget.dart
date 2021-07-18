import 'package:flutter/material.dart';

class ZakazCardWidget extends StatelessWidget {
  const ZakazCardWidget(
      {Key? key,
      required this.id,
      required this.date,
      required this.name,
      required this.status,
      required this.price})
      : super(key: key);
  final String id;
  final String name;
  final DateTime date;
  final String status;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 95,
        padding:
            const EdgeInsets.only(top: 16, bottom: 13, left: 13, right: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Divider(
              height: 22,
              color: Color.fromRGBO(166, 170, 180, 0.6),
            ),
            Row(
              children: [
                Text(
                  '${date.day}/${date.month}/${date.year}',
                  style: TextStyle(
                    color: Color.fromRGBO(117, 127, 140, 1),
                    fontSize: 14,
                  ),
                ),
                Text(
                  '${date.hour}:${date.minute}',
                  style: TextStyle(
                    color: Color.fromRGBO(117, 127, 140, 1),
                    fontSize: 14,
                  ),
                ),
                Text(
                  status != 'завершен' ? status : '$price сом',
                  style: TextStyle(
                      color: Color.fromRGBO(117, 127, 140, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            )
          ],
        ),
      ),
    );
  }
}
