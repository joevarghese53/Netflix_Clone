import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class Landscapewidget extends StatelessWidget {
  const Landscapewidget({super.key, this.imgheight = 175});

  final double imgheight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: SizedBox(
            width: double.infinity,
            height: imgheight,
            child: Image.asset('assets/NewAndHot.png', fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 10,
          child: CircleAvatar(
            backgroundColor: kblack.withOpacity(0.5),
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_off, color: kwhite, size: 22),
            ),
          ),
        ),
      ],
    );
  }
}
