import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:commons/modules/products/domain/use_case/offers/offer_get_use_case.dart';
import 'package:mapbeauty/modules/core/presentation/view_model/base_view_model.dart';

class OfferViewModel extends BaseViewModel {
  final GetOffersUseCase _getOffersUseCase;
  OfferViewModel({required GetOffersUseCase getOffersUseCase}) : _getOffersUseCase = getOffersUseCase;

  List<Offer>? offers;

  Future<void> loadOffers() async {
    offers = await _getOffersUseCase.execute();
  }
}
