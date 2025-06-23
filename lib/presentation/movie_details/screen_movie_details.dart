import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/infrastructure/watchlist_service.dart';

class ScreenMovieDetails extends StatefulWidget {
  final Downloads movie;

  const ScreenMovieDetails({super.key, required this.movie});

  @override
  State<ScreenMovieDetails> createState() => _ScreenMovieDetailsState();
}

class _ScreenMovieDetailsState extends State<ScreenMovieDetails> {
  bool _isInWatchlist = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _checkWatchlist();
  }

  Future<void> _checkWatchlist() async {
    final isIn = await WatchlistService.isInWatchlist(widget.movie);
    setState(() {
      _isInWatchlist = isIn;
      _loading = false;
    });
  }

  Future<void> _toggleWatchlist() async {
    print('Toggle watchlist pressed for: ${widget.movie.title}');
    setState(() => _loading = true);
    try {
      if (_isInWatchlist) {
        print('Removing from watchlist...');
        await WatchlistService.removeFromWatchlist(widget.movie);
        print('Removed from watchlist');
      } else {
        print('Adding to watchlist...');
        await WatchlistService.addToWatchlist(widget.movie);
        print('Added to watchlist');
      }
      await _checkWatchlist();
    } catch (e) {
      print('Error in _toggleWatchlist: $e');
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.movie.posterPath != null
                          ? 'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}'
                          : 'https://via.placeholder.com/500x750',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.cast, color: Colors.white),
                onPressed: () {},
              ),
              kwidth,
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.title ?? 'Unknown Title',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  kheight,
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          '2024',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      kwidth,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          '2h 15m',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      kwidth,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'TV-MA',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  kheight20,
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Play trailer
                          },
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('Play'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      kwidth,
                      ElevatedButton.icon(
                        onPressed: _loading ? null : _toggleWatchlist,
                        icon: Icon(_isInWatchlist ? Icons.check : Icons.add),
                        label: Text(_isInWatchlist ? 'Added' : 'My List'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ],
                  ),
                  kheight20,
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  kheight,
                  const Text(
                    'This is a placeholder overview for the movie. In a real implementation, this would be fetched from the TMDB API along with other movie details like cast, genres, and ratings.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
