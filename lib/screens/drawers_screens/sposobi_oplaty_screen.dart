import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/payment_card_controller.dart';
import 'package:test_app/widgets/appBar.dart';
import 'package:test_app/widgets/app_drawer.dart';
import 'package:test_app/widgets/card_containers/payment_card_widget.dart';

import 'add_card_screen.dart';

class SposobiOplatyScreen extends StatelessWidget {
  final PaymentCardController _cardController =
      Get.put(PaymentCardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('Способы оплаты'),
      drawer: const AppDrawer(),
      body: Obx(
        () => _cardController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: _cardController.payCardList.length,
                          itemBuilder: (context, index) => PaymentCardWidget(
                            isEnable:
                                _cardController.payCardList[index].isEnable!,
                            // id: _cardController.payCardList[index].id!,
                            index: index,
                            cardNumber:
                                _cardController.payCardList[index].cardNumber!,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await Get.to(() => AddCardScreen());
                        },
                        child: Text('Добавить карту'),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
