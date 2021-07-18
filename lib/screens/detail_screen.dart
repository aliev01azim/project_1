import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/screens/status_zakaza_screen.dart';
import 'package:test_app/widgets/appBar.dart';
import 'package:test_app/widgets/app_drawer.dart';
import 'package:test_app/widgets/inputs/input_comment.dart';
import 'package:test_app/widgets/inputs/input_counter.dart';
import 'package:test_app/widgets/inputs/input_date.dart';
import 'package:test_app/widgets/inputs/input.dart';
import 'package:test_app/widgets/inputs/input_kuda_poedem.dart';
import 'package:test_app/widgets/inputs/itogi.dart';

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

  void callBackForCount(int valueFromThere) {
    setState(() {
      _selectedCount = valueFromThere;
    });
  }

  void callBackForComment(String valueFromThere) {
    commentCharacters.add(valueFromThere);
    setState(() {
      _commentValue = commentCharacters.last;
    });
  }

  void callBackForDate(DateTime valueFromThere) {
    setState(() {
      _selectedDate = valueFromThere;
    });
  }

  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  int _selectedCount = 2;
  String _commentValue = '';
  List<String> commentCharacters = [];

  final TextEditingController _datePickerController = TextEditingController();
  final TextEditingController _counterController = TextEditingController();
  final TextEditingController _kudaPoedemController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Детали заказа'),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 15, right: 35, bottom: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Input(
                  value: 'ул Токтогула 114',
                  prefix: 'Откуда',
                  isUnderlinedBorder: true,
                ),
                Input(
                  value: 'тц Ала-Арча',
                  prefix: 'Куда',
                  isUnderlinedBorder: true,
                ),
                InputKudaPoedem(
                    value: 'куда поедем?', prefix: 'Куда', text: ''),
                InputDate(callBackForDate),
                InputCounter(callBackForCount),
                InputComment(callBackForComment),
                const SizedBox(height: 80),
                ItogiInputov(name: 'Авто', count: 0),
                const SizedBox(height: 12),
                ItogiInputov(name: 'Грузчики', count: _selectedCount),
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
                ElevatedButton(
                  onPressed: () async {
                    await Get.to(() => StatusZakazaScreen(
                        date: _selectedDate,
                        count: _selectedCount,
                        comment: _commentValue));
                  },
                  child: Text('Заказать'),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(double.infinity, 56),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
