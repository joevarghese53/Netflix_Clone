import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import 'landscapewidget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('netflixSeries.png', width: 40, height: 50),
            const Text(
              'Friends',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            kheight,
            const Text(
              'This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls ofwork, life and love in 1990s Manhattan',
              style: TextStyle(color: Colors.grey),
            ),
            kheight40,
            const Landscapewidget(imgheight: 200),
            kheight20,
            Row(
              children: [
                Container(width: 50, height: 50, color: Colors.transparent),
                const Spacer(),
                const CustomButtonWidget(
                  icon: Icons.share,
                  text: 'Share',
                  iconsize: 25,
                  textsize: 13,
                ),
                kwidth,
                const CustomButtonWidget(
                  icon: Icons.add,
                  text: 'My List',
                  iconsize: 25,
                  textsize: 13,
                ),
                kwidth,
                const CustomButtonWidget(
                  icon: Icons.play_arrow,
                  text: 'Play',
                  iconsize: 25,
                  textsize: 13,
                ),
                kwidth,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
