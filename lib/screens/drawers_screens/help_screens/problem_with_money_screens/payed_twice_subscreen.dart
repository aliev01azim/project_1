import 'package:flutter/material.dart';
import 'package:test_app/screens/drawers_screens/help_screens/question_form_widget.dart';
import 'package:test_app/widgets/appBar.dart';

class PayedTwiceSubscreen extends StatelessWidget {
  const PayedTwiceSubscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Заплатили дважды'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                  '''Если заказ оформлен по карте и способ оплаты не менялся, деньги спишутся автоматически, отдавать водителю наличные не нужно.

Если вы по ошибке заплатили наличными и картой, попробуйте связаться с водителем, кнопка звонка в течение суток доступна в истории заказов.

Иногда банк может дважды оповестить вас о списании, потому что деньги сначала замораживаются на карте и только потом списываются. Проверить, что лишних списаний не было, вы можете в банковской выписке.

У вас другой вопрос по оплате — напишите, пожалуйста, мы во всём разберёмся.
              '''),
              QuestionFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
