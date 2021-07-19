import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/constants/constants.dart';

//ignore: must_be_immutable
class MiniContainerWidget extends StatefulWidget {
  MiniContainerWidget(
      this.image, this.name, this.isShowed, this.isActive, this.callBack,
      {Key? key})
      : super(key: key);
  final String name;
  final String image;
  final bool isShowed;
  bool isActive;
  final Function callBack;

  @override
  State<MiniContainerWidget> createState() => _MiniContainerWidgetState();
}

class _MiniContainerWidgetState extends State<MiniContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final deviceWitdh = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        widget.callBack(widget.isShowed);
      },
      child: Column(children: [
        Container(
          width: deviceWitdh < 340 ? 60 : 70,
          height: deviceWitdh < 340 ? 60 : 70,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.isActive
                ? Color.fromRGBO(97, 62, 234, 0.2)
                : Color.fromRGBO(240, 240, 240, 1),
            border: widget.isActive
                ? Border.all(color: Colorss.primary, width: 1)
                : null,
          ),
          child: SvgPicture.asset(
            widget.image,
            alignment: Alignment.center,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.name,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            height: 1,
            color: Color.fromRGBO(59, 65, 75, 1),
          ),
        )
      ]),
    );
  }
}
