import 'package:backoffice/modules/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "MAP",
              style: GoogleFonts.belleza(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            TextSpan(
                text: " beauty",
                style: GoogleFonts.allura(
                  fontSize: 30,
                  color: Colors.black,
                )),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.offers),
          child: Text("Promoção do dia"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.brands),
          child: Text("Cadastros"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.login),
          child: Text("Sair"),
        ),
      ],
    );
  }
}
