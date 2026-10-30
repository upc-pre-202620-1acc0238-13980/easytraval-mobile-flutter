import 'package:easy_travel/features/home/domain/destination.dart';

class HomeState {
  const new({
    this.destinations = const [],
    this.favoriteIds = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  final List<Destination> destinations;
  final List<int> favoriteIds;
  final bool isLoading;
  final String? errorMessage;

  HomeState copyWith({
    List<Destination>? destinations,
    List<int>? favoriteIds,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      destinations: destinations ?? this.destinations,
      favoriteIds: favoriteIds ?? this.favoriteIds,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
