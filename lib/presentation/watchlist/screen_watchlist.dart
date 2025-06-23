import 'package:flutter/material.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/infrastructure/watchlist_service.dart';
import 'package:netflix/presentation/movie_details/screen_movie_details.dart';

class ScreenWatchlist extends StatefulWidget {
  const ScreenWatchlist({super.key});

  @override
  State<ScreenWatchlist> createState() => _ScreenWatchlistState();
}

class _ScreenWatchlistState extends State<ScreenWatchlist> {
  List<Downloads> _movies = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadWatchlist();
  }

  Future<void> _loadWatchlist() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      print('Loading watchlist...');
      final movies = await WatchlistService.loadWatchlist();
      print('Loaded movies: ${movies.length}');
      setState(() {
        _movies = movies;
        _loading = false;
      });
    } catch (e, st) {
      print('Error loading watchlist: ${e.toString()}');
      print(st);
      setState(() {
        _error = 'Failed to load watchlist.';
        _loading = false;
      });
    }
  }

  Future<void> _removeFromWatchlist(Downloads movie) async {
    await WatchlistService.removeFromWatchlist(movie);
    await _loadWatchlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My List',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 27,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : _movies.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Your watchlist is empty',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tap the "My List" button on any movie\nto add it to your watchlist',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                final movie = _movies[index];
                return GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenMovieDetails(movie: movie),
                      ),
                    );
                    _loadWatchlist();
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              movie.posterPath != null
                                  ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                                  : 'https://via.placeholder.com/120x180',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () => _removeFromWatchlist(movie),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
