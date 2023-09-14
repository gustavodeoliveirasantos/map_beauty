import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Utils {
  static String uuid() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  static int uuidInteger() {
    final now = DateTime.now();
    return now.millisecondsSinceEpoch;
  }

  static void sendFeedbackEmail(String appName) async {
    var packageInfo = await PackageInfo.fromPlatform();
    var deviceInfo = DeviceInfoPlugin();
    var osVersion = "";
    String? devideModel = "";
    String os = "";

    if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      osVersion = "Android Version = ${androidInfo.version}";
      devideModel = androidInfo.device;
      os = "(Android)";
    } else {
      var iosInfo = await deviceInfo.iosInfo;
      osVersion = "iOS Version: ${iosInfo.systemVersion}";
      devideModel = iosInfo.model;
      os = "(iOS)";
    }

    var body = "\n\n\n\n $osVersion \nApp Version: ${packageInfo.version} \nDevice Model: $devideModel \n\nObs: Esses detalhes nos ajudam a resolver os problemas melhor";

    final Email email = Email(
      body: body,
      subject: '$appName - Feeback/Sugestões $os',
      recipients: ['mylife.apps.2023@gmail.com'], //TODO: Alterar o email da MAP aqui
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (exc) {
      debugPrint('FlutterEmailSender ERROR $exc');
    }
  }
}
