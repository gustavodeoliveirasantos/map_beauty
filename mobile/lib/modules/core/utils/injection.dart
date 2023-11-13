import 'package:commons/modules/firebase_service/firebase_storage_service.dart';
import 'package:commons/modules/products/domain/repository/offer_repository.dart';
import 'package:commons/modules/products/domain/use_case/offers/offer_get_use_case.dart';
import 'package:commons/modules/products/service/service/offer_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mapbeauty/modules/product/domain/repository/product_repository.dart';
import 'package:mapbeauty/modules/product/domain/use_case/load_brands_use_case.dart';
import 'package:mapbeauty/modules/product/domain/use_case/load_products_by_brand_use_case.dart';
import 'package:mapbeauty/modules/product/domain/use_case/load_similar_products_use_case.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/offer_view_model.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/product_view_model.dart';
import 'package:mapbeauty/modules/product/services/store/product_store.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

//Store
    getIt.registerSingleton<ProductStore>(ProductStoreImpl());
    getIt.registerFactory<OfferService>(() => OfferServiceImpl(database: FirebaseDatabase.instance));
    //Repository
    getIt.registerFactory<ProductRepository>(() => ProductRepositoryImpl(store: getIt()));
    getIt.registerFactory<OfferRepository>(() => OfferRepositoryImpl(getIt(), getIt()));

    //Use cases
    getIt.registerFactory<LoadBrandsUseCase>(() => LoadBrandsUseCaseImpl(repository: getIt()));
    getIt.registerFactory<LoadProductsUseCase>(() => LoadProductsUseCaseImpl(repository: getIt()));
    getIt.registerFactory<LoadSimilarProductsUseCase>(() => LoadSimilarProductsUseCaseImpl(repository: getIt()));

    getIt.registerFactory<GetOffersUseCase>(() => GetOffersUseCaseImpl(getIt()));

    //View Models

    getIt.registerFactory<OfferViewModel>(() => OfferViewModel(getOffersUseCase: getIt()));
    getIt.registerFactory<ProductViewModel>(() => ProductViewModel(
          loadBrandsUseCase: getIt(),
          loadProductsUseCase: getIt(),
          loadSimilarProductsUseCase: getIt(),
        ));

    getIt.registerLazySingleton<FirebaseStorageService>(() => FirebaseStorageServiceImpl(FirebaseStorage.instance));
  }
}
