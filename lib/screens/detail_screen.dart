import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/constants/constants.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void dispose() {
    _datePickerController.dispose();
    _counterController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  int _selectedCount = 0;
  final TextEditingController _datePickerController = TextEditingController();
  final TextEditingController _counterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детали заказа'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 23, left: 15, right: 35, bottom: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    input('ул Токтогула 114', 'Откуда', true, false),
                    input('тц Ала-Арча', 'Куда', false, false),
                    // inputData('Дата/время'),
                    inputCounter('Кол-во гр'),
                    inputComment('Комментарий'),
                    const SizedBox(height: 32),
                    Text('Стоимость авто/час = 1000 сом'),
                    const SizedBox(height: 32),
                    Text('Стоимость грузчиков/час = 1000 сом'),
                    const SizedBox(height: 32),
                    Text('ИТОГО 2000 сом/час'),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Заказать'),
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 56))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget input(String value, String pref, [bool? isFirst, bool? isArrow]) {
    return TextFormField(
      initialValue: value,
      onTap: () {},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: isFirst! ? 10 : 50, bottom: 8),
        labelText: pref,
        suffix: isArrow!
            ? Icon(
                Icons.arrow_drop_down,
                size: 30,
              )
            : null,
      ),
    );
  }

  Widget inputData(String text) {
    return TextFormField(
      onTap: _selectDate,
      controller: _datePickerController,
      decoration: InputDecoration(
        hintText:
            "${_selectedDate.month} - ${_selectedDate.day} - ${_selectedDate.minute} мин.",
        contentPadding: EdgeInsets.only(top: 50, bottom: 8),
        labelText: text,
        suffix: Icon(
          Icons.arrow_drop_down,
          size: 30,
        ),
      ),
    );
  }

  Widget inputCounter(String text) {
    _counterController.text = '0';
    return TextFormField(
      onTap: _selectAmount,
      controller: _counterController,
      decoration: InputDecoration(
        hintText: _counterController.text,
        contentPadding: EdgeInsets.only(top: 50, bottom: 8),
        labelText: text,
        suffix: Icon(
          Icons.arrow_drop_down,
          size: 30,
        ),
      ),
    );
  }

  Widget inputComment(String pref) {
    return TextFormField(
      initialValue: '',
      maxLines: 10,
      minLines: 1,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 30, bottom: 8),
        labelText: pref,
      ),
    );
  }

  _selectDate() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime tempPickedDate = _selectedDate;
        return Container(
          padding: EdgeInsets.all(16),
          height: 242,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text('Дата и время'),
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
            "${pickedDate.month} - ${pickedDate.day} - ${pickedDate.minute} мин.";
      });
    }
  }

  _selectAmount() async {
    int? pickedAmount = await showModalBottomSheet<int>(
      context: context,
      builder: (context) {
        DateTime tempPickedDate = _selectedDate;
        return Container(
          padding: EdgeInsets.all(16),
          height: 242,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text('Кол-во грузчиков'),
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.remove_circle),
                          color: Colorss.buttonCounterColor,
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(_counterController.text),
                        const SizedBox(
                          width: 70,
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.add_circle)),
                      ],
                    )),
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

    if (pickedAmount! < 0) {
      setState(() {
        _selectedCount = pickedAmount;
        _counterController.text = _selectedCount.toString();
      });
    }
  }
}
