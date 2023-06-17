import 'package:act2/src/provider/peliculas_providers.dart';
import 'package:act2/src/search/search_delegate.dart';
import 'package:act2/src/widgets/card_swiper_widget.dart';
import 'package:act2/src/widgets/movie_slider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text('Películas'),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Tarjetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),

              // Slider de películas
              MovieSlider(
                movies: moviesProvider.popularMovies, // populares,
                title: 'Populares', // opcional
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
