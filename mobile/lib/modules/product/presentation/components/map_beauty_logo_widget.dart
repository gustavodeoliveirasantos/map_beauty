import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapBeautyLogoWidget extends StatelessWidget {
  const MapBeautyLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
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
    );
  }
}
