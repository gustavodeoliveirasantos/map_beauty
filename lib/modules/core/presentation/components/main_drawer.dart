import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_routes.dart';
import '../../utils/map_beauty_in_app_review.dart';
import '../../utils/utils.dart';

class MainDrawerWidget extends StatelessWidget {
  void sendEmail() async {
    Utils.sendFeedbackEmail('MAP Beauty');
  }

  Future<void> _openInstagram() async {
    const urlString = 'https://instagram.com/mylife_apps?igshid=OGQ5ZDc2ODk2ZA==';
    final uri = Uri.parse(urlString);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $urlString');
    }
  }

  void shareMyQuotes() {
    //TODO adicionar possibilidade de dar Share no MAP Beauty
    //TODO: Alterar URLDs

    const shareText = '''Baixe agora a MAP Beauty:
    
Google Play: play.google.com/store/apps/details?id=pt.com.mylife.myquotes
App Store: apps.apple.com/pt/app/my-quotes/id6448951931''';
    Share.share(
      shareText,
      subject: "Compartilhar MAP Beauty",
    );
  }

  void rateApp() {
    MapBeautyInAppReview.openStoreListing(appStoreId: "6448951931"); //TODO: Alterar Store ID aqui
  }

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width * 0.85;
    final controller = ScrollController();
    return Drawer(
      width: maxWidth > 450 ? 450 : maxWidth,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Scrollbar(
            controller: controller,
            child: ListView(
              controller: controller,
              children: [
                ListTile(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  trailing: IconButton(
                    splashRadius: 24,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(
                    'Configurações',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    Icons.format_quote_sharp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onTap: () {},
                  title: const Text('Sobre o MAP Beauty'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.star,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onTap: rateApp,
                  title: const Text('Avalie o App'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onTap: () {
                    sendEmail();
                  },
                  title: const Text('Feedback / Entre em contato'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications_active,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onTap: () {
                    Navigator.of(context).popAndPushNamed(AppRoutes.notifications);
                  },
                  title: const Text('Notificações'),
                ),
                ListTile(
                  leading: Icon(
                    Platform.isIOS ? Icons.ios_share : Icons.share,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onTap: shareMyQuotes,
                  title: const Text('Compartilhar MAP Beauty'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Redes Socias: ",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _openInstagram,
                      child: const CircleAvatar(
                        backgroundColor: Colors.black12,
                        foregroundColor: Colors.black87,
                        child: Icon(FontAwesome5.instagram),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
