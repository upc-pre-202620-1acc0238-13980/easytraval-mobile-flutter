import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';

class GetDestinationsUseCase {
  final DestinationRepository repository;

  const GetDestinationsUseCase({required this.repository});

  Future<List<Destination>> execute() async {
    return await repository.getDestinations();
  }
}
