import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';
import '../../core/constants.dart';
import 'widgets/coming_soon_widget.dart';
import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(98),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            actions: [
              const Icon(Icons.cast, color: kwhite, size: 30),
              kwidth,
              Container(width: 30, height: 30, color: Colors.blue),
              kwidth,
            ],
            bottom: TabBar(
              labelColor: kblack,
              unselectedLabelColor: kwhite,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.circular(30),
              ),
              tabs: const [
                Tab(text: '🍿 Coming Soon'),
                Tab(text: '👀 Everyone\'s Watching'),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [_comingsoon(), _everyoneswatching()]),
      ),
    );
  }

  Widget _comingsoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ComingSoonWidget();
      },
    );
  }

  Widget _everyoneswatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const EveryonesWatchingWidget();
      },
    );
  }
}
