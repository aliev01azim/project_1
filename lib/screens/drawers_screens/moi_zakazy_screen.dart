import 'package:flutter/material.dart';
import 'package:test_app/models/zakaz_model.dart';
import 'package:test_app/widgets/appBar.dart';
import 'package:test_app/widgets/app_drawer.dart';
import 'package:test_app/widgets/card_containers/zakaz_card_widget.dart';

class MoiZakazy extends StatelessWidget {
  MoiZakazy({Key? key}) : super(key: key);
  final Future<List<ZakazModel>> _fetchAndSetCards =
      Future<List<ZakazModel>>.delayed(
          // гет запрос на бэк
          const Duration(),
          () => [
                ZakazModel(
                    id: '1',
                    name: 'Газель с грузчиками',
                    status: 'в пути',
                    date: DateTime.now(),
                    price: '2000'),
                ZakazModel(
                    id: '2',
                    name: 'Газель',
                    status: 'выполняется',
                    date: DateTime.now(),
                    price: '3500'),
                ZakazModel(
                    id: '3',
                    name: 'Грузчики',
                    status: 'завершен',
                    date: DateTime.now(),
                    price: '8990'),
                ZakazModel(
                    id: '4',
                    name: 'Эвакуатор',
                    status: 'завершен',
                    date: DateTime.now(),
                    price: '1200'),
                ZakazModel(
                    id: '5',
                    name: 'Грузчики',
                    status: 'завершен',
                    date: DateTime.now(),
                    price: '3222'),
                ZakazModel(
                    id: '6',
                    name: 'Спецтехника',
                    status: 'завершен',
                    date: DateTime.now(),
                    price: '1200'),
              ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Мои заказы'),
      drawer: AppDrawer(),
      body: SafeArea(
        child: FutureBuilder(
          future: _fetchAndSetCards,
          builder: (context, AsyncSnapshot<List<ZakazModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return RefreshIndicator(
              onRefresh: () => _fetchAndSetCards,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 20),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ZakazCardWidget(
                      id: snapshot.data![index].id,
                      date: snapshot.data![index].date,
                      name: snapshot.data![index].name,
                      status: snapshot.data![index].status,
                      price: snapshot.data![index].price),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
