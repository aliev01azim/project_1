import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/screens/kuda_poedem_screen.dart';
import 'package:test_app/screens/status_zakaza_screen.dart';

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
    _kudaPoedemController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  int _selectedCount = 2;

  final TextEditingController _datePickerController = TextEditingController();
  final TextEditingController _counterController = TextEditingController();
  final TextEditingController _kudaPoedemController = TextEditingController();
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    input('ул Токтогула 114', 'Откуда', true),
                    input('тц Ала-Арча', 'Куда'),
                    inputKudaPoedem('куда поедем?', 'Куда', 'Пр Мира 981'),
                    inputData('Дата/время'),
                    inputCounter('Кол-во гр'),
                    inputComment('Комментарий'),
                    const SizedBox(height: 80),
                    description('Авто'),
                    const SizedBox(height: 12),
                    description('Грузчики', true),
                    const Divider(
                      height: 32,
                    ),
                    Text(
                      'ИТОГО ${_selectedCount * 500 + 1000} сом/час',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Get.to(() => StatusZakazaScreen());
                  },
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

  Widget input(String value, String pref, [bool isFirst = false]) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: isFirst ? 10 : 50, bottom: 8),
        labelText: pref,
      ),
    );
  }

  Widget inputKudaPoedem(String value, String pref, String? text) {
    return TextFormField(
      // initialValue: text!,
      decoration: InputDecoration(
          hintText: value,
          contentPadding: EdgeInsets.only(top: 50, bottom: 8),
          labelText: pref,
          suffix: TextButton(
              onPressed: () {
                Get.to(() => KudaPoedemScreen());
              },
              child: Text(
                'карта',
                style: TextStyle(
                  color: Color.fromRGBO(97, 62, 234, 1),
                  fontSize: 16,
                ),
              ))),
    );
  }

  Widget inputData(String text) {
    return TextFormField(
      onTap: _selectDate,
      readOnly: true,
      controller: _datePickerController,
      decoration: InputDecoration(
        hintText:
            "${_selectedDate.month} мес ${_selectedDate.day} день - ${_selectedDate.hour} ч - ${_selectedDate.minute} мин.",
        contentPadding: EdgeInsets.only(top: 50, bottom: 8),
        labelText: text,
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          size: 30,
        ),
        suffixIconConstraints:
            BoxConstraints(minWidth: 0, minHeight: 0, maxHeight: 0),
      ),
    );
  }

  Widget inputCounter(String text) {
    return TextFormField(
      readOnly: true,
      onTap: _selectAmount,
      controller: _counterController,
      decoration: InputDecoration(
        hintText: '${_selectedCount}',
        contentPadding: EdgeInsets.only(top: 50, bottom: 8),
        labelText: text,
        suffixIconConstraints:
            BoxConstraints(minWidth: 0, minHeight: 0, maxHeight: 0),
        suffixIcon: Icon(
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
        contentPadding: EdgeInsets.only(top: 50, bottom: 8),
        labelText: pref,
      ),
    );
  }

  Widget description(String name, [bool _isGruzchiki = false]) {
    return Row(
      children: [
        Text(_isGruzchiki ? '$name ($_selectedCount)' : '$name'),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('1 час'),
            SizedBox(
              width: 30,
            ),
            Text(_isGruzchiki ? '${_selectedCount * 500}сом' : '1000сом')
          ],
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
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
    }
  }

  _selectAmount() async {
    int? pickedAmount = await showModalBottomSheet<int>(
      context: context,
      builder: (context) {
        int tempPickedCounter = _selectedCount;
        return StatefulBuilder(
            builder: (BuildContext contxt, StateSetter setState) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 242,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    const Text('Кол-во грузчиков'),
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
                            onPressed: () {
                              setState(() {
                                if (tempPickedCounter > 0) {
                                  tempPickedCounter--;
                                } else {
                                  tempPickedCounter = 0;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove_circle),
                            color: Colorss.buttonCounterColor,
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Text(tempPickedCounter.toString()),
                          const SizedBox(
                            width: 70,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                tempPickedCounter++;
                              });
                            },
                            icon: const Icon(Icons.add_circle),
                            color: Colorss.buttonCounterColor,
                          ),
                        ],
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(tempPickedCounter);
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
        });
      },
    );

    if (pickedAmount != null) {
      setState(() {
        _selectedCount = pickedAmount;
        _counterController.text = _selectedCount.toString();
      });
    }
  }
}
