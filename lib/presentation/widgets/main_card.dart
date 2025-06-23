import 'package:flutter/material.dart';

import '../../core/constants.dart';

class MainCardG extends StatelessWidget {
  final String posterPath;
  final String? title;
  final VoidCallback? onTap;

  const MainCardG({
    super.key,
    required this.posterPath,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(posterPath),
              fit: BoxFit.cover,
            ),
            borderRadius: kborderrad,
          ),
        ),
      ),
    );
  }
}
