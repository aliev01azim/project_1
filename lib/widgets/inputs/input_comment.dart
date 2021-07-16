import 'package:flutter/material.dart';

class InputComment extends StatefulWidget {
  final Function callBack;
  InputComment(this.callBack, {Key? key}) : super(key: key);

  @override
  State<InputComment> createState() => _InputCommentState();
}

class _InputCommentState extends State<InputComment> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (value) => widget.callBack(value),
      maxLines: 10,
      minLines: 1,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 50, bottom: 8),
        labelText: 'Комментарий',
      ),
    );
  }
}
