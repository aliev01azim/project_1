import 'package:get/get.dart';
import 'package:test_app/models/payment_card_model.dart';

class PaymentCardController extends GetxController {
  var isLoading = false.obs;
  var payCardList = <PaymentCardModel>[
    PaymentCardModel(
      id: '0',
      cardNumber: 'Наличные',
      isEnable: true,
    ),
  ].obs;

  @override
  void onInit() {
    fetchAllData();
    super.onInit();
  }

  void fetchAllData() async {
    isLoading(true);
    try {
      final List<PaymentCardModel> _loadedCards = [];
      // _loadedCards.add(PaymentCardModel(
      //       theirs's data
      //     ));
      if (_loadedCards.isNotEmpty) {
        payCardList.addAll(_loadedCards);
      }
    } finally {
      isLoading(false);
    }
  }

  void addCard(PaymentCardModel card) async {
    //
    try {
      isLoading(true);
      payCardList.add(card);
    } finally {
      isLoading(false);
    }
  }
}
