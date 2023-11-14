import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:mapbeauty/firebase_options.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
import 'package:mapbeauty/modules/core/utils/injection.dart';

class AppBootstrap {
  static Future<void> initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Inject.init();
  }

  static loadFindationData() {
    // Findation.loadData();
  }
  static String getInitialRoute() {
    return AppRoutes.home;
  }
}
