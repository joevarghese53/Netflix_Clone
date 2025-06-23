import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import 'custom_button_widget.dart';

class BackgroundCardWidget extends StatelessWidget {
  const BackgroundCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/mainImage.png')),
          ),
        ),
        Positioned(
          bottom: 2,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(icon: Icons.add, text: 'My List'),
                _playButton(),
                const CustomButtonWidget(icon: Icons.info, text: 'Info'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    onPressed: () {},
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhite)),
    icon: const Icon(Icons.play_arrow, color: kblack),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Play',
        style: TextStyle(
          fontSize: 20,
          color: kblack,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
