import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  @override
  Future<List<Destination>> getDestinations() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      Destination(
        id: 1,
        title: 'Punta Cana Blue',
        country: 'Dominican Republic',
        image: 'https://i.imgur.com/P6RCC9n.png',
        rating: 4.7,
      ),
    ];
  }
}
