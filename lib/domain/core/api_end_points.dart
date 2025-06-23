import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = '$kbaseurl/trending/all/day?api_key=$apikey';
  static const search =
      '$kbaseurl/search/movie?api_key=$apikey&query=SEARCH_TERM';
}
