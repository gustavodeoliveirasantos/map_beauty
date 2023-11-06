import 'package:backoffice/modules/products/domain/repository/brand_repository.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_add_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_delete_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_get_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_upload_image_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_update_use_case.dart';
import 'package:backoffice/modules/products/presentation/view_model/brand_view_model.dart';
import 'package:backoffice/modules/products/service/service/brand_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //Services
    getIt.registerFactory<BrandService>(
      () => BrandServiceImpl(database: FirebaseDatabase.instance),
    );
    //Repositories
    getIt.registerFactory<BrandRepository>(
      () => BrandRepositoryImpl(service: getIt()),
    );

    //Use cases
    getIt.registerFactory<AddBrandUseCase>(
      () => AddBrandUseCaseImpl(repository: getIt()),
    );

    getIt.registerFactory<DeleteBrandUseCase>(
      () => DeleteBrandUseCaseImpl(repository: getIt()),
    );
    getIt.registerFactory<GetBrandsUseCase>(
      () => GetBrandsUseCaseImpl(repository: getIt()),
    );
    getIt.registerFactory<UploadImageBrandUseCase>(
      () => UploadImageBrandUseCaseImpl(repository: getIt()),
    );
    getIt.registerFactory<UpdateBrandUseCase>(
      () => UpdateBrandUseCaseImpl(repository: getIt()),
    );

    //ViewModels
    getIt.registerFactory<BrandViewModel>(
      () => BrandViewModel(
        getBrandsUseCase: getIt(),
        addBrandUseCase: getIt(),
        updateBrandUseCase: getIt(),
        updateImageBrandUseCase: getIt(),
        deleteBrandUseCase: getIt(),
      ),
    );
  }
}
