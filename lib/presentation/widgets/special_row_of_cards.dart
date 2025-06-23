import 'package:flutter/material.dart';

import '../home/widgets/special_main_card.dart';
import 'main_title.dart';

class SpecialRowOfCards extends StatelessWidget {
  const SpecialRowOfCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: MainTitle(
            title: 'Top 10 TV Shows in India Today',
          ),
        ),
        LimitedBox(
          maxHeight: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) {
                return SpecialMainCard(
                  index: index + 1,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
