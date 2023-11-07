import 'package:backoffice/firebase_options.dart';
import 'package:backoffice/modules/core/utils/app_routes.dart';
import 'package:backoffice/modules/core/utils/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AppBootstrap {
  static Future<void> initializeApp() async {
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
