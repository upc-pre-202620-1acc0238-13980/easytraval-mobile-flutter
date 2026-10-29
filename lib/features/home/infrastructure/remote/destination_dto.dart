class DestinationDto {
  final int id;
  final String title;
  final String country;
  final String image;
  final double rating;

  const new({
    required this.id,
    required this.title,
    required this.country,
    required this.image,
    required this.rating,
  });

  factory DestinationDto.fromJson(Map<String, dynamic> json) {
    return DestinationDto(
      id: json['id'],
      title: json['title'],
      country: json['country'],
      image: json['posterPath'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
