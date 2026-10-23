import 'package:easy_travel/features/home/domain/destination.dart';

abstract class DestinationRepository {
  
  Future<List<Destination>> getDestinations();
}