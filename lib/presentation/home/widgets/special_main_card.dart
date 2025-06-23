import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';

import '../../../core/constants.dart';

class SpecialMainCard extends StatelessWidget {
  const SpecialMainCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(width: 40, height: 200),
              Container(
                width: 120,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('darkDesire.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: kborderrad,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -40,
            child: BorderedText(
              strokeWidth: 5,
              strokeColor: kwhite,
              child: Text(
                '$index',
                style: TextStyle(
                  fontSize: 130,
                  color: kblack,
                  fontWeight: FontWeight.w900,
                  fontFamily: GoogleFonts.jost().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
