import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/constants.dart';
import '../../core/colors/colors.dart';
import '../widgets/row_of_cards.dart';
import '../widgets/special_row_of_cards.dart';
import '../movie_details/screen_movie_details.dart';
import 'widgets/bg_card_widget.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(
        context,
      ).add(const DownloadsEvent.getDownloadsImage());
    });

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollnotifier,
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollnotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollnotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<DownloadsBloc, DownloadsState>(
                  builder: (context, state) {
                    return ListView(
                      children: [
                        const BackgroundCardWidget(),
                        RowOfCards(
                          title: "Released in the Past Year",
                          movies: state.downloads,
                          onCardTap: (movie) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ScreenMovieDetails(movie: movie),
                              ),
                            );
                          },
                        ),
                        kheight13,
                        RowOfCards(
                          title: "Trending Now",
                          movies: state.downloads,
                          onCardTap: (movie) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ScreenMovieDetails(movie: movie),
                              ),
                            );
                          },
                        ),
                        kheight13,
                        const SpecialRowOfCards(),
                        kheight13,
                        RowOfCards(
                          title: "Tense Dramas",
                          movies: state.downloads,
                          onCardTap: (movie) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ScreenMovieDetails(movie: movie),
                              ),
                            );
                          },
                        ),
                        kheight13,
                        RowOfCards(
                          title: "South Indian Cinema",
                          movies: state.downloads,
                          onCardTap: (movie) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ScreenMovieDetails(movie: movie),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                scrollnotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 100,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                kwidth,
                                Image.asset(
                                  'NetflixLogo.png',
                                  width: 60,
                                  height: 50,
                                ),
                                const Spacer(),
                                const Icon(Icons.cast, color: kwhite, size: 30),
                                kwidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.blue,
                                ),
                                kwidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                kwidth40,
                                TextButton(
                                  onPressed: () {},
                                  child: Text('TV Shows', style: khomestyle),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Movies', style: khomestyle),
                                ),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: kwhite,
                                  ),
                                  label: Text('Categories', style: khomestyle),
                                ),
                                kwidth40,
                              ],
                            ),
                          ],
                        ),
                      )
                    : kheight,
              ],
            ),
          );
        },
      ),
    );
  }
}
