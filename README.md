# Movie App

Final project for the Route Flutter course: a movies app built on The Movie Database (TMDB) API, with browsing, search and a local watchlist.

## Features

- Home tab: popular movies, new releases and recommended picks
- Browse tab: movies by genre, with a screen for each category
- Search tab: find any movie by name
- Movie details: overview, rating and similar movies
- Watchlist: save movies locally and manage them with swipe actions
- Animated splash, loading and error views

## Tech Stack

- **Flutter / Dart**
- **API:** TMDB (`api.themoviedb.org`)
- **State management:** flutter_bloc (Cubit) + dartz
- **Dependency injection:** get_it + injectable
- **Local storage:** hive + hive_flutter for the watchlist
- **UI:** carousel_slider, cached_network_image, flutter_slidable, lottie, readmore

## Architecture

Layered structure under `lib/`: `data/` (response models, repo implementations, data sources), `domain/` (contracts, use cases, DI) and `ui/` (screens and view models).

## Getting Started

The app reads its TMDB API key from `lib/ui/utils/end_points.dart`. Get a free key at [themoviedb.org](https://www.themoviedb.org/settings/api), then:

```bash
flutter pub get
dart run build_runner build
flutter run
```
