import 'package:backoffice/modules/core/utils/app_routes.dart';

class AppBootstrap {
  static initializeApp() async {
    // await Firebase.initializeApp(
    //     //  options: DefaultFirebaseOptions.currentPlatform,
    //     );
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
