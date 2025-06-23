import 'package:flutter/material.dart';
import 'main_card.dart';
import 'main_title.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

class RowOfCards extends StatelessWidget {
  final String title;
  final List<Downloads> movies;
  final void Function(Downloads)? onCardTap;

  const RowOfCards({
    super.key,
    required this.title,
    required this.movies,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: MainTitle(title: title),
        ),
        LimitedBox(
          maxHeight: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(movies.length, (index) {
              final movie = movies[index];
              return MainCardG(
                posterPath: movie.posterPath != null
                    ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                    : 'https://via.placeholder.com/120x180',
                title: movie.title,
                onTap: onCardTap != null ? () => onCardTap!(movie) : null,
              );
            }),
          ),
        ),
      ],
    );
  }
}
