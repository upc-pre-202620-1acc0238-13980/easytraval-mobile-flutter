import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/infrastructure/remote/destination_dto.dart';

extension DestinationDtoMapper on DestinationDto {
  Destination toDomain() {
    return Destination(
      id: id,
      title: title,
      country: country,
      image: image,
      rating: rating,
      price: price,
      tags: tags,
      overview: overview,
      city: city,
      bestSeason: bestSeason,
      type: type
    );
  }
}
