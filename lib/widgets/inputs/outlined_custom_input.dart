import 'package:flutter/material.dart';

//ignore: must_be_immutable
class CustomOutlinedInput extends StatelessWidget {
  CustomOutlinedInput(
      {Key? key,
      required this.isComment,
      required this.title,
      required this.propertyOfCard,
      required this.callBack})
      : super(key: key);
  String propertyOfCard;
  final Function callBack;
  final String title;
  final bool isComment;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: '* ',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ])),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: Color.fromRGBO(185, 188, 221, 1),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: Color.fromRGBO(185, 188, 221, 1),
                width: 1,
              ),
            ),
          ),
          validator: (value) {
            if (value!.length == 0) {
              return 'Заполните это поле';
            }
            return null;
          },
          textInputAction:
              isComment ? TextInputAction.newline : TextInputAction.done,
          maxLines: isComment ? 3 : 1,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.black),
          onSaved: (newValue) {
            propertyOfCard = newValue!;
            callBack(propertyOfCard);
          },
        ),
      ],
    );
  }
}
