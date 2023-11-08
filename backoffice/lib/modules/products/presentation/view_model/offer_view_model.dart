import 'package:backoffice/modules/core/utils/extensions.dart';
import 'package:backoffice/modules/products/domain/models/offer_model.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_activate_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_add_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_deactivate_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_delete_image_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_delete_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_get_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_update_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_upload_image_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class OfferViewModel extends ChangeNotifier {
  final AddOfferUseCase _addOfferUseCase;
  final DeleteOfferImageUseCase _deleteOfferImageUseCase;
  final DeleteOfferUseCase _deleteOfferUseCase;
  final GetOffersImageUseCase _getOffersImageUseCase;
  final UpdateOfferUseCase _updateOfferUseCase;
  final UploadOfferImageUseCase _uploadOfferImageUseCase;
  final ActivateOffersUseCase _activateOffersUseCase;
  final DeactivateOffersUseCase _deactivateOffersUseCase;

  Map<DateTime, List<Offer>> offersMap = {};
  List<Offer> _offers = [];

  OfferViewModel({
    required AddOfferUseCase addOfferUseCase,
    required DeleteOfferImageUseCase deleteOfferImageUseCase,
    required DeleteOfferUseCase deleteOfferUseCase,
    required GetOffersImageUseCase getOffersImageUseCase,
    required UpdateOfferUseCase updateOfferUseCase,
    required UploadOfferImageUseCase uploadOfferImageUseCase,
    required ActivateOffersUseCase activateOffersUseCase,
    required DeactivateOffersUseCase deactivateOffersUseCase,
  })  : _addOfferUseCase = addOfferUseCase,
        _deleteOfferImageUseCase = deleteOfferImageUseCase,
        _deleteOfferUseCase = deleteOfferUseCase,
        _getOffersImageUseCase = getOffersImageUseCase,
        _updateOfferUseCase = updateOfferUseCase,
        _uploadOfferImageUseCase = uploadOfferImageUseCase,
        _activateOffersUseCase = activateOffersUseCase,
        _deactivateOffersUseCase = deactivateOffersUseCase {
    getOffers();
  }

  Future<void> getOffers() async {
    _offers = await _getOffersImageUseCase.execute();
    loadOffersMap();

    notifyListeners();
  }

  void loadOffersMap() {
    for (var offer in _offers) {
      final shortDateKey = offer.date.shortDate();
      if (!offersMap.keys.contains(shortDateKey)) {
        offersMap[shortDateKey] = [];
      }
      offersMap[shortDateKey]?.add(offer);
    }
  }

  Future<void> addOffer(Offer offer, DateTime dateKey) async {
    offersMap[dateKey]?.add(offer);

    _addOfferUseCase.execute(offer).onError((error, stackTrace) {
      offersMap[dateKey]?.remove(offer);
      notifyListeners();
      //TODO - Apresentar erro aqui
    });

    notifyListeners();
  }

  Future<void> updateOffer(Offer updatedOffer, DateTime dateKey) async {
    final offersList = offersMap[dateKey];

    final index = offersList?.indexWhere((element) => element.id == updatedOffer.id);
    final oldOffer = offersList![index!];

    offersList.removeWhere((element) => element.id == updatedOffer.id);
    offersList.insert(index, updatedOffer);

    _updateOfferUseCase.execute(updatedOffer).onError((error, stackTrace) {
      offersList.removeWhere((element) => element.id == updatedOffer.id);
      offersList.insert(index, oldOffer);
      notifyListeners();
    });

    notifyListeners();
  }

  Future<void> deleteOffer(Offer offer, DateTime dateKey) async {
    final offersList = offersMap[dateKey];
    final index = offersList?.indexWhere((element) => element.id == offer.id);
    final copyOffer = offer.copyWith();
    offersList?.remove(offer);

    _deleteOfferUseCase.execute(offer).onError((error, stackTrace) {
      offersList?.insert(index!, copyOffer);
    });

    notifyListeners();
  }

  Future<void> activateOffersByDate(DateTime dateKey) async {
    final offersList = offersMap[dateKey]!;
    final ids = offersList.map((e) => e.id).toList();

    final List<Offer> updatedList = [];
    final List<Offer> oldList = [];

    for (var offer in offersList) {
      oldList.add(offer.copyWith());
      updatedList.add(offer.copyWith(isActive: true));
    }

    offersMap[dateKey] = updatedList;

    _activateOffersUseCase.execute(ids).onError((error, stackTrace) {
      offersMap[dateKey] = oldList;
      notifyListeners();
    });

    notifyListeners();
  }

  Future<void> deactivateOffersByDate(DateTime dateKey) async {
    final offersList = offersMap[dateKey]!;
    final ids = offersList.map((e) => e.id).toList();

    final List<Offer> updatedList = [];
    final List<Offer> oldList = [];

    for (var offer in offersList) {
      oldList.add(offer.copyWith());
      updatedList.add(offer.copyWith(isActive: false));
    }

    offersMap[dateKey] = updatedList;

    _deactivateOffersUseCase.execute(ids).onError((error, stackTrace) {
      offersMap[dateKey] = oldList;
      print(error);
      notifyListeners();
    });

    notifyListeners();
  }

  Future<void> activateOffer(DateTime dateKey, Offer updatedOffer) async {
    final offersList = offersMap[dateKey];

    final index = offersList?.indexWhere((element) => element.id == updatedOffer.id);
    final oldOffer = offersList![index!];

    offersList.removeWhere((element) => element.id == updatedOffer.id);
    offersList.insert(index, updatedOffer);

    _activateOffersUseCase.execute([updatedOffer.id]).onError((error, stackTrace) {
      offersList.removeWhere((element) => element.id == updatedOffer.id);
      offersList.insert(index, oldOffer);

      notifyListeners();
    });

    notifyListeners();
  }

  Future<void> deactivateOffer(DateTime dateKey, Offer updatedOffer) async {
    final offersList = offersMap[dateKey];

    final index = offersList?.indexWhere((element) => element.id == updatedOffer.id);
    final oldOffer = offersList![index!];

    offersList.removeWhere((element) => element.id == updatedOffer.id);
    offersList.insert(index, updatedOffer);

    _deactivateOffersUseCase.execute([updatedOffer.id]).onError((error, stackTrace) {
      offersList.removeWhere((element) => element.id == updatedOffer.id);
      offersList.insert(index, oldOffer);
      print("error");
      notifyListeners();
    });

    notifyListeners();
  }
}
