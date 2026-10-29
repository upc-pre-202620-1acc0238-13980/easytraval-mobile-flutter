import 'package:easy_travel/features/home/domain/destination.dart';

class HomeState {
  const new({
    this.destinations = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  final List<Destination> destinations;
  final bool isLoading;
  final String? errorMessage;

  HomeState copyWith({
    List<Destination>? destinations,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      destinations: destinations ?? this.destinations,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
