import 'package:flutter/material.dart';
import 'package:test_app/constants/constants.dart';

class InputCounter extends StatefulWidget {
  const InputCounter(this.callBackForCounter, {Key? key}) : super(key: key);
  final Function callBackForCounter;
  @override
  _InputCounterState createState() => _InputCounterState();
}

class _InputCounterState extends State<InputCounter> {
  @override
  void dispose() {
    _counterController.dispose();
    super.dispose();
  }

  int _selectedCount = 2;

  final TextEditingController _counterController = TextEditingController();

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
      widget.callBackForCounter(_selectedCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: _selectAmount,
      controller: _counterController,
      decoration: InputDecoration(
        hintText: '${_selectedCount}',
        contentPadding: EdgeInsets.only(top: 50, bottom: 8),
        labelText: 'Кол-во гр',
        suffixIconConstraints:
            BoxConstraints(minWidth: 0, minHeight: 0, maxHeight: 0),
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          size: 30,
        ),
      ),
    );
  }
}
