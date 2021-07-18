import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/models/payment_card_model.dart';
import 'package:test_app/widgets/appBar.dart';
import 'package:test_app/widgets/app_drawer.dart';
import 'package:test_app/widgets/card_containers/payment_card_widget.dart';

import 'add_card_screen.dart';

class SposobiOplatyScreen extends StatelessWidget {
  SposobiOplatyScreen({Key? key}) : super(key: key);
  final Future<List<PaymentCardModel>> _fetchAndSetPayments =
      Future<List<PaymentCardModel>>.delayed(
          // гет запрос на бэк
          const Duration(),
          () => [
                PaymentCardModel(
                  id: '0',
                  cardNumber: 'Наличные',
                  isEnable: true,
                ),
              ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Способы оплаты'),
      drawer: AppDrawer(),
      body: SafeArea(
        child: FutureBuilder(
          future: _fetchAndSetPayments,
          builder: (context, AsyncSnapshot<List<PaymentCardModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return RefreshIndicator(
              onRefresh: () => _fetchAndSetPayments,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => PaymentCardWidget(
                            isEnable: snapshot.data![index].isEnable!,
                            id: snapshot.data![index].id!,
                            index: index,
                            cardNumber: snapshot.data![index].cardNumber!,
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
                          child: Text('Добавить карту')),
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
