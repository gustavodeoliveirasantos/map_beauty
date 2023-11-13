import 'package:backoffice/main.dart';
import 'package:backoffice/modules/core/utils/extensions.dart';
import 'package:backoffice/modules/core/utils/view_utils.dart';
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

class OfferViewModel extends ChangeNotifier {
  final AddOfferUseCase _addOfferUseCase;
  final DeleteOfferUseCase _deleteOfferUseCase;
  final GetOffersImageUseCase _getOffersImageUseCase;
  final UpdateOfferUseCase _updateOfferUseCase;
  final UploadOfferImageUseCase _uploadOfferImageUseCase;
  final DeleteOfferImageUseCase _deleteOfferImageUseCase;
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

  Future<void> addOffer(Offer offer) async {
    final dateKey = offer.date.shortDate();

    if (!offersMap.containsKey(dateKey)) {
      offersMap[dateKey] = [offer];
    } else {
      offersMap[dateKey]?.insert(0, offer);
    }

    await _addOfferUseCase.execute(offer).onError((error, stackTrace) {
      offersMap[dateKey]?.remove(offer);

      notifyListeners();
      ViewUtils.showErrorAlert(context: globalKey?.currentContext, description: "Tente novamente mais tarde");
      return Future.error("error");
    }).then((value) => notifyListeners());
  }

  Future<void> updateOffer(Offer updatedOffer) async {
    final dateKey = updatedOffer.date.shortDate();
    final offersList = offersMap[dateKey];

    final index = offersList?.indexWhere((element) => element.id == updatedOffer.id);
    final oldOffer = offersList![index!];

    offersList.removeWhere((element) => element.id == updatedOffer.id);
    offersList.insert(index, updatedOffer);

    _updateOfferUseCase.execute(updatedOffer).onError((error, stackTrace) {
      offersList.removeWhere((element) => element.id == updatedOffer.id);
      offersList.insert(index, oldOffer);
      notifyListeners();
      ViewUtils.showErrorAlert(context: globalKey?.currentContext, description: "Tente novamente mais tarde");
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
      ViewUtils.showErrorAlert(context: globalKey?.currentContext, description: "Tente novamente mais tarde");
    });

    notifyListeners();
  }

  Future<void> deleteOffersByDate(DateTime dateKey) async {
    //TODO: Fazer um refactor aqui... Ao excluir todas as offers e se der algum erro, como tratar?
    final offersList = offersMap[dateKey];
    if (offersList == null || offersList.isEmpty) return;

    final List<Offer> offersCopies = [];
    for (int index = 0; index < offersList.length; index++) {
      final offer = offersList[index];
      offersCopies.add(offer);

      // offersList.remove(offer);

      _deleteOfferUseCase.execute(offer).onError((error, stackTrace) {
        //  offersList.insert(index, copyOffer);
        ViewUtils.showErrorAlert(context: globalKey?.currentContext, description: "Tente novamente mais tarde");
      });
    }
    offersMap.remove(dateKey);
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
      ViewUtils.showErrorAlert(context: globalKey?.currentContext, description: "Tente novamente mais tarde");
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

      notifyListeners();
      ViewUtils.showErrorAlert(context: globalKey?.currentContext, description: "Tente novamente mais tarde");
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
      ViewUtils.showErrorAlert(context: globalKey?.currentContext, description: "Tente novamente mais tarde");
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
      ViewUtils.showErrorAlert(context: globalKey?.currentContext, description: "Tente novamente mais tarde");
    });

    notifyListeners();
  }

  Future<void> uploadImages(Offer offer, List<Map<String, dynamic>?> images, Function(Offer) onComplete) async {
    final currentImages = offer.images;

    for (var map in images) {
      final Uint8List imageData = map?["imageData"];
      final String imageName = map?["imageName"];

      final input = UploadOfferImageUseCaseInput(offer: offer, imageName: imageName, imageData: imageData);
      await _uploadOfferImageUseCase.execute(input);

      offer.images.add(imageName);
    }
    onComplete(offer);
  }

  Future<void> deleteImage(Offer offer, String imageName, Function(Offer) onComplete) async {
    await _deleteOfferImageUseCase.execute(DeleteOfferImageInput(imageName: imageName, offer: offer));

    offer.images.remove(imageName);

    onComplete(offer);
  }
}
