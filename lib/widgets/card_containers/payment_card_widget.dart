import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/constants/constants.dart';

class PaymentCardWidget extends StatefulWidget {
  PaymentCardWidget(
      {Key? key,
      required this.isEnable,
      required this.id,
      required this.cardNumber,
      required this.index})
      : super(key: key);
  bool? isEnable;
  final int index;
  final String id;
  final String cardNumber;
  @override
  _PaymentCardWidgetState createState() => _PaymentCardWidgetState();
}

class _PaymentCardWidgetState extends State<PaymentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 95,
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: Center(
          child: Row(
            children: [
              widget.index == 0
                  ? Container(
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset(
                        Images.giveMoney,
                        fit: BoxFit.scaleDown,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colorss.primary, width: 1),
                          borderRadius: BorderRadius.circular(4)),
                    )
                  : SvgPicture.asset(Images.miniContainer2),
              const SizedBox(
                width: 16,
              ),
              Text(
                widget.index == 0 ? 'Наличные' : widget.cardNumber,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Spacer(),
              Switch(
                  value: widget.index == 0 ? true : widget.isEnable!,
                  activeColor: Colorss.primary,
                  activeTrackColor: Colorss.primary,
                  inactiveTrackColor: Colors.grey,
                  thumbColor: MaterialStateProperty.all(Colors.white),
                  onChanged: (bool newValue) {
                    setState(() {
                      widget.isEnable = newValue;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
