import 'package:commons/modules/firebase_service/firebase_storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mapbeauty/modules/product/domain/repository/product_repository.dart';
import 'package:mapbeauty/modules/product/domain/use_case/load_brands_use_case.dart';
import 'package:mapbeauty/modules/product/domain/use_case/load_products_by_brand_use_case.dart';
import 'package:mapbeauty/modules/product/domain/use_case/load_similar_products_use_case.dart';
import 'package:mapbeauty/modules/product/services/store/product_store.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

//Store
    getIt.registerSingleton<ProductStore>(ProductStoreImpl());
    //Repository
    getIt.registerFactory<ProductRepository>(() => ProductRepositoryImpl(store: getIt()));

    //Use cases
    getIt.registerFactory<LoadBrandsUseCase>(() => LoadBrandsUseCaseImpl(repository: getIt()));
    getIt.registerFactory<LoadProductsUseCase>(() => LoadProductsUseCaseImpl(repository: getIt()));
    getIt.registerFactory<LoadSimilarProductsUseCase>(() => LoadSimilarProductsUseCaseImpl(repository: getIt()));

    // getIt.registerSingleton<ProductStore>(() => ProductStoreImpl());

    getIt.registerLazySingleton<FirebaseStorageService>(() => FirebaseStorageServiceImpl(FirebaseStorage.instance));
  }
}
