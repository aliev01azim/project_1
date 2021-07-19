import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/screens/drawers_screens/help_screens/help_screen.dart';
import 'package:test_app/screens/drawers_screens/moi_zakazy_screen.dart';
import 'package:test_app/screens/drawers_screens/personal_data_screen.dart';
import 'package:test_app/screens/drawers_screens/sposobi_oplaty_screen.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/screens/start_screens/start_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colorss.primary,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Icon(
                Icons.account_circle_outlined,
                size: 60,
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '+996 555 123 123',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              _createDrawerItem(
                  icon: Icons.home_outlined,
                  text: 'Главная',
                  onTap: () async {
                    await Get.offAll(() => HomeScreen());
                  }),
              _createDrawerItem(
                  icon: Icons.person_outlined,
                  text: 'Персональные данные',
                  onTap: () async {
                    await Get.offAll(() => PersonalDataScreen());
                  }),
              _createDrawerItem(
                  icon: Icons.history_outlined,
                  text: 'Мои заказы',
                  onTap: () async {
                    await Get.offAll(() => MoiZakazy());
                  }),
              _createDrawerItem(
                  icon: Icons.credit_card_outlined,
                  text: 'Способы оплаты',
                  onTap: () async {
                    await Get.offAll(() => SposobiOplatyScreen());
                  }),
              _createDrawerItem(
                  icon: Icons.info_outlined,
                  text: 'Помощь',
                  onTap: () async {
                    await Get.offAll(() => HelpScreen());
                  }),
              const SizedBox(
                height: 30,
              ),
              _createDrawerItem(
                  icon: Icons.logout_outlined,
                  text: 'Выход',
                  onTap: () async {
                    //hivebox.clear)
                    await Get.offAll(() => StartScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
