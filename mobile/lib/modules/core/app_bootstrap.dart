import 'package:cloud_functions/cloud_functions.dart';
import 'package:commons/modules/core/utils/view_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mapbeauty/firebase_options.dart';
import 'package:mapbeauty/main.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
import 'package:mapbeauty/modules/core/utils/injection.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await AppBootstrap.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class AppBootstrap {
  static Future<void> initializeApp() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await Firebase.initializeApp(
      name: "map-beauty",
      options: DefaultFirebaseOptions.currentPlatform,
    );

    requestNotificationsPermission();

    configureNotifications();
    _setupInteractedMessage();
    Inject.init();
    testFirebaseFunction();
  }

  static testFirebaseFunction() async {
    //  try {
    print("entrou aqui");
    final result = await FirebaseFunctions.instance.httpsCallable('helloWorld').call();
    print("1234");
    print("GOS - ${result.data}");
    print("lalala");
    // final lala = result.data as String;
    //  print(lala);
    // FirebaseFunctions firebaseFunctions = FirebaseFunctions.instance;
    // HttpsCallable callable = firebaseFunctions.httpsCallable('helloWorld');
    // final results = await callable();
    // final String test = results.data;
    // print(test);
    // } on FirebaseFunctionsException catch (e) {
    //   print(e);
    //   print(e.message);
    //   print(e.details);
    //   print(e.code);
    // } catch (e) {
    //   // Do other things that might be thrown that I have overlooked
    // }
  }

  static loadFindationData() {
    // Findation.loadData();
  }
  static String getInitialRoute() {
    return AppRoutes.home;
  }

  static requestNotificationsPermission() async {
    //https://firebase.flutter.dev/docs/messaging/permissions
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  static configureNotifications() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint("⚠️ APN TOKEN -> $fcmToken");
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      // TODO: If necessary send token to application server.

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    }).onError((err) {
      // Error getting token.
    });
  }

  static Future<void> _setupInteractedMessage() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      ViewUtils.showAlert(context: globalKey?.currentContext, title: "Notificação Recebida", description: "lalalal");

      print('LALALALALALAALALALAL');
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  static void _handleMessage(RemoteMessage message) {
    final context = globalKey?.currentContext;
    if (context == null) {
      print("ERROR - Context NULL");
      return;
    }
    //TODO:  Fazer uma rota aqui se for preciso..
    ViewUtils.showAlert(context: globalKey?.currentContext, title: "Notificação Recebida", description: "lalalal");
  }
}
