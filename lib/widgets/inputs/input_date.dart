import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputDate extends StatefulWidget {
  const InputDate(this.callBackForDate, {Key? key}) : super(key: key);
  final Function callBackForDate;
  @override
  _InputDateState createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  @override
  void dispose() {
    _datePickerController.dispose();
    super.dispose();
  }

  _selectDate() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime tempPickedDate = _selectedDate;
        return Container(
          padding: const EdgeInsets.all(16),
          height: 242,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const Text('Дата и время'),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: CupertinoDatePicker(
                    backgroundColor: Colors.white,
                    maximumYear: 2025,
                    initialDateTime: _selectedDate,
                    minimumYear: 2021,
                    minimumDate: _selectedDate,
                    mode: CupertinoDatePickerMode.dateAndTime,
                    use24hFormat: true,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(tempPickedDate);
                },
                child: Text('Применить'),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 56),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _datePickerController.text =
            "${pickedDate.month} мес ${pickedDate.day} день - ${pickedDate.hour} ч - ${pickedDate.minute} мин.";
      });
      widget.callBackForDate(_selectedDate);
    }
  }

  DateTime _selectedDate = DateTime.now();

  final TextEditingController _datePickerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: _selectDate,
      readOnly: true,
      controller: _datePickerController,
      decoration: InputDecoration(
        hintText:
            "${_selectedDate.month} мес ${_selectedDate.day} день - ${_selectedDate.hour} ч - ${_selectedDate.minute} мин.",
        contentPadding: EdgeInsets.only(top: 50, bottom: 8),
        labelText: 'Дата/время',
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          size: 30,
        ),
        suffixIconConstraints:
            BoxConstraints(minWidth: 0, minHeight: 0, maxHeight: 0),
      ),
    );
  }
}
