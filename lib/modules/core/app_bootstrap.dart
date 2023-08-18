import 'package:firebase_core/firebase_core.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';

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

  static String getInitialRoute() {
    return AppRoutes.home;
  }
}
