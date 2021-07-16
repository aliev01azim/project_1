import 'package:flutter/material.dart';
import 'package:test_app/widgets/inputs/input_kuda_otkuda.dart';
import 'package:test_app/widgets/inputs/itogi.dart';
import 'package:test_app/widgets/status_zakaza_slider_widgets/first_slider_of_status_zakaza.dart';
import 'package:test_app/widgets/status_zakaza_slider_widgets/fourst_slider_of_status_zakaza.dart';
import 'package:test_app/widgets/status_zakaza_slider_widgets/second_slider_of_status_zakaza.dart';
import 'package:test_app/widgets/status_zakaza_slider_widgets/third_slider_of_status_zakaza.dart';

class StatusZakazaScreen extends StatefulWidget {
  const StatusZakazaScreen(
      {Key? key,
      required this.date,
      required this.count,
      required this.comment})
      : super(key: key);
  final int count;
  final DateTime date;
  final String comment;

  @override
  State<StatusZakazaScreen> createState() => _StatusZakazaScreenState();
}

class _StatusZakazaScreenState extends State<StatusZakazaScreen> {
  PageController controller = PageController();
  var currentPageValue = 0.0;
  static const _kDuration = Duration(milliseconds: 200);
  static const _kCurve = Curves.ease;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  int _timersTimeValue = 0;
  void callBackForTimerEndTime(int valueFromThere) {
    if (this.mounted) {
      setState(() {
        _timersTimeValue = valueFromThere;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ газели, 14.07.2021'),
      ),
      // это так,Для демонстарции
      // тут надо сделать наверное чтоб с бэка как пришло обновление статуса -
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // то вот этот код
          await controller.nextPage(duration: _kDuration, curve: _kCurve);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputKudaOtkuda(
                  value: 'ул Токтогула 114',
                  prefix: 'Откуда',
                  isUnderlinedBorder: false),
              InputKudaOtkuda(
                  value: 'тц Ала-Арча',
                  prefix: 'Куда',
                  isUnderlinedBorder: false),
              InputKudaOtkuda(
                  value:
                      "${widget.date.month} мес ${widget.date.day} день - ${widget.date.hour} ч - ${widget.date.minute} мин.",
                  prefix: 'Дата и время',
                  isUnderlinedBorder: false),
              InputKudaOtkuda(
                  value: widget.count.toString(),
                  prefix: 'Кол-во грузчиков',
                  isUnderlinedBorder: false),
              InputKudaOtkuda(
                  value: widget.comment,
                  prefix: 'Комментарий',
                  isUnderlinedBorder: false),
              const SizedBox(
                height: 20,
              ),
              ItogiInputov(name: 'Авто', count: -1),
              const SizedBox(
                height: 12,
              ),
              ItogiInputov(name: 'Грузчики', count: widget.count),
              const Divider(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Стоимость ',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '${widget.count * 500 + 1000} сом/час',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
              const SizedBox(
                height: 31,
              ),
              Text(
                'Статус заказа',
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                constraints: BoxConstraints(
                    minHeight: 180,
                    maxHeight: 230,
                    minWidth: MediaQuery.of(context).size.width),
                child: PageView(
                  controller: controller,
                  children: [
                    FirstSliderOfStatusZakaza(),
                    SecondSliderOfStatusZakaza(),
                    ThirdSliderOfStatusZakaza(callBackForTimerEndTime),
                    FourstSliderOfStatusZakaza(
                        time: _timersTimeValue,
                        itogo: (widget.count * 500 + 1000)),
                  ],
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
