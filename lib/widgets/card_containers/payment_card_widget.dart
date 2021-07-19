import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/constants/constants.dart';

//ignore: must_be_immutable
class PaymentCardWidget extends StatefulWidget {
  PaymentCardWidget(
      {Key? key,
      required this.isEnable,
      // required this.id,
      required this.cardNumber,
      required this.index})
      : super(key: key);
  bool? isEnable;
  final int index;
  // final String id;
  final String cardNumber;
  @override
  _PaymentCardWidgetState createState() => _PaymentCardWidgetState();
}

class _PaymentCardWidgetState extends State<PaymentCardWidget> {
  String? cardNumber;

  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    cardNumber = widget.index != 0
        ? widget.cardNumber.replaceRange(4, 12, ' **** **** ')
        : 'Наличные';
    final _deviceWidth = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        height: _deviceWidth < 350 ? 80 : 95,
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth < 350 ? 10 : 17),
        child: Center(
          child: Row(
            children: [
              Container(
                width: _deviceWidth < 350 ? 34 : 40,
                height: _deviceWidth < 350 ? 34 : 40,
                child: SvgPicture.asset(
                  widget.index == 0 ? Images.giveMoney : Images.visa,
                  fit: BoxFit.scaleDown,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colorss.primary, width: 1),
                    borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                cardNumber!,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Spacer(),
              Switch(
                  value: isActive,
                  activeColor: Colorss.primary,
                  activeTrackColor: Colorss.primary,
                  inactiveTrackColor: Colors.grey,
                  thumbColor: MaterialStateProperty.all(Colors.white),
                  onChanged: (bool newValue) {
                    setState(() {
                      isActive = newValue;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
