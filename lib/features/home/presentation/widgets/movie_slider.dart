import 'package:flutter/material.dart';
import 'package:flutter_web_docker/core/routes/resource_icons.dart';

import '../../../../core/routes/routes_constants.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../core/theme/fonts.dart';
import '../../../movies/domain/entities/result_playing_movies_entity.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key, required this.popularMovies, this.title});

  final List<ResultPlayingMoviesEntity> popularMovies;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Populares',
                style: textBlackStyleSubTitle,
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: popularMovies.length,
                itemBuilder: (_, int index) {
                  return _MoviePoster(
                    movie: popularMovies[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final ResultPlayingMoviesEntity movie;
  const _MoviePoster({required this.movie});

  @override
  Widget build(BuildContext context) {
    final posterPath = movie.posterPath;

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                NavigationService.navigateTo(RoutesConstants.deviceRoute),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage(noImage),
                image:
                    NetworkImage('https://image.tmdb.org/t/p/w500$posterPath'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
