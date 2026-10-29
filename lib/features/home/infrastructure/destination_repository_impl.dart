import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';
import 'package:easy_travel/features/home/infrastructure/remote/destination_api.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationApi api;

  const new({required this.api});

  @override
  Future<List<Destination>> getDestinations() async {
    List dtos = await api.getDestinations();

    return dtos
        .map(
          (e) => Destination(
            id: e.id,
            title: e.title,
            country: e.country,
            image: e.image,
            rating: e.rating,
          ),
        )
        .toList();
  }
}
