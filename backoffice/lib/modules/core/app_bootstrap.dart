import 'package:backoffice/firebase_options.dart';
import 'package:backoffice/modules/core/utils/app_routes.dart';
import 'package:backoffice/modules/core/utils/injection.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AppBootstrap {
  static Future<void> initializeApp() async {
    Inject.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    testFirebaseFunction();

    // Ideal time to initialize
// await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
// //...
// }
  }

  static testFirebaseFunction() async {
    try {
      print("entrou aqui");
      final result = await FirebaseFunctions.instance.httpsCallable('helloWorld').call();
      final lala = result.data as String;
      print(lala);
      // FirebaseFunctions firebaseFunctions = FirebaseFunctions.instance;
      // HttpsCallable callable = firebaseFunctions.httpsCallable('helloWorld');
      // final results = await callable();
      // final String test = results.data;
      // print(test);
    } on FirebaseFunctionsException catch (e) {
      //print(e);
      print(e.message);
      print(e.details);
      print(e.code);
    } catch (e) {
      print(e);
      // Do other things that might be thrown that I have overlooked
    }
  }

  static loadFindationData() {
    // Findation.loadData();
  }
  static String getInitialRoute() {
    return AppRoutes.home;
  }
}
