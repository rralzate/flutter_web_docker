import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/resource_icons.dart';
import '../../../../core/routes/routes_constants.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../movies/domain/entities/result_playing_movies_entity.dart';

class CardSwiper extends StatefulWidget {
  const CardSwiper({super.key, required this.onDisplaymovies});

  final List<ResultPlayingMoviesEntity> onDisplaymovies;

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  late double _swiperWidth;
  late double _swiperHeight;

  @override
  void initState() {
    super.initState();
    // Inicializar las variables necesarias
    _swiperWidth = 300.0;
    _swiperHeight = 400.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Inicializar las variables necesarias
    _swiperWidth = size.width * 0.2;
    _swiperHeight = size.height * 0.6;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Swiper(
          itemCount: widget.onDisplaymovies.length,
          layout: SwiperLayout.STACK,
          itemWidth: _swiperWidth,
          itemHeight: _swiperHeight,
          itemBuilder: (_, int index) {
            final movie = widget.onDisplaymovies[index];

            final posterPath = movie.posterPath;

            return GestureDetector(
              onTap: () =>
                  NavigationService.navigateTo(RoutesConstants.deviceRoute),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage(noImage),
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500$posterPath'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
