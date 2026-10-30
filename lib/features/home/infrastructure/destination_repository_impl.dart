import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';
import 'package:easy_travel/features/home/infrastructure/mappers/destination_mapper.dart';
import 'package:easy_travel/features/home/infrastructure/remote/destination_api.dart';
import 'package:easy_travel/features/home/infrastructure/remote/destination_dto.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationApi api;

  const new({required this.api});

  @override
  Future<List<Destination>> getDestinations() async {
    List<DestinationDto> dtos = await api.getDestinations();

    return dtos.map((e) => e.toDomain()).toList();
  }
}
