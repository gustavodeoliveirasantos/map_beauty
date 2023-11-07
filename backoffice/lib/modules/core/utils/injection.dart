import 'package:backoffice/modules/firebase_service/firebase_storage_service.dart';
import 'package:backoffice/modules/products/domain/repository/offer_repository.dart';
import 'package:backoffice/modules/products/domain/use_case/brand/brand_add_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand/brand_delete_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand/brand_get_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand/brand_update_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand/brand_upload_image_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_activate_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_add_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_deactivate_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_delete_image_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_delete_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_get_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_update_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/offers/offer_upload_image_use_case.dart';
import 'package:backoffice/modules/products/presentation/view_model/offer_view_model.dart';
import 'package:backoffice/modules/products/service/service/offer_service.dart';
import 'package:backoffice/modules/products/domain/repository/brand_repository.dart';
import 'package:backoffice/modules/products/presentation/view_model/brand_view_model.dart';
import 'package:backoffice/modules/products/service/service/brand_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //BRANDS
    //Services
    getIt.registerFactory<BrandService>(() => BrandServiceImpl(database: FirebaseDatabase.instance));
    getIt.registerFactory<OfferService>(() => OfferServiceImpl(database: FirebaseDatabase.instance));
    //Repositories
    getIt.registerFactory<BrandRepository>(() => BrandRepositoryImpl(getIt(), getIt()));
    getIt.registerFactory<OfferRepository>(() => OfferRepositoryImpl(getIt(), getIt()));

    //Use cases
    getIt.registerFactory<AddBrandUseCase>(() => AddBrandUseCaseImpl(getIt()));
    getIt.registerFactory<DeleteBrandUseCase>(() => DeleteBrandUseCaseImpl(getIt()));
    getIt.registerFactory<GetBrandsUseCase>(() => GetBrandsUseCaseImpl(getIt()));
    getIt.registerFactory<UploadImageBrandUseCase>(() => UploadImageBrandUseCaseImpl(getIt()));
    getIt.registerFactory<UpdateBrandUseCase>(() => UpdateBrandUseCaseImpl(getIt()));

    getIt.registerFactory<AddOfferUseCase>(() => AddOfferUseCaseImpl(getIt()));
    getIt.registerFactory<DeleteOfferImageUseCase>(() => DeleteOfferImageUseCaseImpl(getIt()));
    getIt.registerFactory<DeleteOfferUseCase>(() => DeleteOfferUseCaseImpl(getIt()));
    getIt.registerFactory<GetOffersImageUseCase>(() => GetOffersImageUseCaseImpl(getIt()));
    getIt.registerFactory<UpdateOfferUseCase>(() => UpdateOfferUseCaseImpl(getIt()));
    getIt.registerFactory<UploadOfferImageUseCase>(() => UploadOfferImageUseCaseImpl(getIt()));
    getIt.registerFactory<ActivateOffersUseCase>(() => ActivateOffersUseCaseImpl(getIt()));
    getIt.registerFactory<DeactivateOffersUseCase>(() => DeactivateOffersUseCaseImpl(getIt()));

    //ViewModels
    getIt.registerFactory<BrandViewModel>(
      () => BrandViewModel(getBrandsUseCase: getIt(), addBrandUseCase: getIt(), updateBrandUseCase: getIt(), updateImageBrandUseCase: getIt(), deleteBrandUseCase: getIt()),
    );

    getIt.registerFactory<OfferViewModel>(
      () => OfferViewModel(
        addOfferUseCase: getIt(),
        deleteOfferImageUseCase: getIt(),
        deleteOfferUseCase: getIt(),
        getOffersImageUseCase: getIt(),
        updateOfferUseCase: getIt(),
        uploadOfferImageUseCase: getIt(),
        activateOffersUseCase: getIt(),
        deactivateOffersUseCase: getIt(),
      ),
    );

    //FIREBASE
    getIt.registerLazySingleton<FirebaseStorageService>(() => FirebaseStorageServiceImpl(FirebaseStorage.instance));
  }
}
