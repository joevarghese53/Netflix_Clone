import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import 'landscapewidget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '  FEB',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              Text(
                ' 1  1 ',
                style: TextStyle(
                  fontFamily: GoogleFonts.anton().fontFamily,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Landscapewidget(),
              kheight,
              Row(
                children: [
                  Text(
                    'TALL GIRL 2',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.rampartOne().fontFamily,
                      letterSpacing: -5,
                    ),
                  ),
                  const Spacer(),
                  const CustomButtonWidget(
                    icon: Icons.notifications,
                    text: 'Remind Me',
                    iconsize: 20,
                    textsize: 10,
                  ),
                  kwidth20,
                  const CustomButtonWidget(
                    icon: Icons.info_rounded,
                    text: 'Info',
                    iconsize: 20,
                    textsize: 10,
                  ),
                  kwidth20,
                ],
              ),
              kheight,
              const Text(
                'Coming On Friday',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Image.asset('assets/OnlyOnNetflix.png', width: 40, height: 50),
              const Text(
                'Tall Girl 2',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence--and her relationship--into a tailspin',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
