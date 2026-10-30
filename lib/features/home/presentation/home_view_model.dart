import 'package:easy_travel/features/favorites/application/get_favorites_use_case.dart';
import 'package:easy_travel/features/favorites/application/toggle_favorite_use_case.dart';
import 'package:easy_travel/features/home/application/get_destinations_use_case.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/home_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final GetDestinationsUseCase getDestinations;
  final ToggleFavoriteUseCase toggleFavorite;
  final GetFavoritesUseCase getFavorites;

  new({
    required this.getDestinations,
    required this.toggleFavorite,
    required this.getFavorites,
  }) {
    loadDestinations();
  }

  HomeState _state = HomeState();
  HomeState get state => _state;

  List<Destination> get favorites => _state.destinations
      .where((destination) => isFavorite(destination.id))
      .toList();

  Future<void> loadDestinations() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final destinations = await getDestinations.execute();
      final favoriteIds = await getFavorites.execute();
      _state = _state.copyWith(
        destinations: destinations,
        favoriteIds: favoriteIds,
        isLoading: false,
      );
    } catch (e) {
      _state = _state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
    notifyListeners();
  }

  Future<void> toggleFavoriteDestination(int id) async {
    await toggleFavorite.execute(id);
    final favoriteIds = await getFavorites.execute();
    _state = _state.copyWith(favoriteIds: favoriteIds);
    notifyListeners();
  }

  bool isFavorite(int id) {
    return _state.favoriteIds.contains(id);
  }
}
