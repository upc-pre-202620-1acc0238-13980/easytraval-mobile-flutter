import 'package:easy_travel/features/home/application/get_destinations_use_case.dart';
import 'package:easy_travel/features/home/presentation/home_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final GetDestinationsUseCase useCase;
  new({required this.useCase}) {
    loadDestinations();
  }

  HomeState _state = HomeState();
  HomeState get state => _state;

  Future<void> loadDestinations() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final destinations = await useCase.execute();
      _state = _state.copyWith(destinations: destinations, isLoading: false);
    } catch (e) {
      _state = _state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
    notifyListeners();
  }
}
