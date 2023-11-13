import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:mapbeauty/firebase_options.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
import 'package:mapbeauty/modules/core/utils/injection.dart';

class AppBootstrap {
  static initializeApp() async {
    Inject.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Ideal time to initialize
// await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
// //...
// }
  }

  static loadFindationData() {
    // Findation.loadData();
  }
  static String getInitialRoute() {
    return AppRoutes.home;
  }
}
