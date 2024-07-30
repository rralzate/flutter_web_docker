import '../models/now_playing_response_model.dart';
import '../models/popular_response_model.dart';

abstract class MoviesDatasource {
  Future<NowPlayingResponseModel> getOnDisplayMovies();

  Future<PopularResponseModel> getPopularMovies();
}
