import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

class WatchlistService {
  static const _key = 'watchlist_movies';

  // Test method to verify SharedPreferences is working
  static Future<bool> testSharedPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('test_key', 'test_value');
      final testValue = prefs.getString('test_key');
      await prefs.remove('test_key');
      return testValue == 'test_value';
    } catch (e) {
      print('SharedPreferences test failed: $e');
      return false;
    }
  }

  static Future<List<Downloads>> loadWatchlist() async {
    try {
      print('Testing SharedPreferences...');
      final testResult = await testSharedPreferences();
      print('SharedPreferences test result: $testResult');

      final prefs = await SharedPreferences.getInstance();
      final jsonStringList = prefs.getStringList(_key) ?? [];
      print('Found ${jsonStringList.length} movies in storage');

      final List<Downloads> movies = [];
      for (final jsonStr in jsonStringList) {
        try {
          final movie = Downloads.fromJson(json.decode(jsonStr));
          movies.add(movie);
        } catch (e) {
          print('Error parsing movie JSON: $jsonStr');
          print('Error: $e');
          // Skip invalid entries
        }
      }
      print('Successfully loaded ${movies.length} movies');
      return movies;
    } catch (e) {
      print('Error in loadWatchlist: $e');
      return [];
    }
  }

  static Future<void> addToWatchlist(Downloads movie) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final watchlist = await loadWatchlist();
      if (!watchlist.any(
        (m) => m.posterPath == movie.posterPath && m.title == movie.title,
      )) {
        watchlist.add(movie);
        final jsonStringList = watchlist
            .map((m) => json.encode(m.toJson()))
            .toList();
        await prefs.setStringList(_key, jsonStringList);
      }
    } catch (e) {
      print('Error adding to watchlist: $e');
    }
  }

  static Future<void> removeFromWatchlist(Downloads movie) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final watchlist = await loadWatchlist();
      watchlist.removeWhere(
        (m) => m.posterPath == movie.posterPath && m.title == movie.title,
      );
      final jsonStringList = watchlist
          .map((m) => json.encode(m.toJson()))
          .toList();
      await prefs.setStringList(_key, jsonStringList);
    } catch (e) {
      print('Error removing from watchlist: $e');
    }
  }

  static Future<bool> isInWatchlist(Downloads movie) async {
    try {
      final watchlist = await loadWatchlist();
      return watchlist.any(
        (m) => m.posterPath == movie.posterPath && m.title == movie.title,
      );
    } catch (e) {
      print('Error checking watchlist: $e');
      return false;
    }
  }
}
