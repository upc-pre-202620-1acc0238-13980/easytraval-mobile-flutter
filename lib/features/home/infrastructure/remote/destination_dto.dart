class DestinationDto {
  final int id;
  final String title;
  final String country;
  final String image;
  final double rating;
  final String overview;
  final String city;
  final String bestSeason;
  final String type;
  final double price;
  final List<String> tags;

  const new({
    required this.id,
    required this.title,
    required this.country,
    required this.image,
    required this.rating,
    required this.overview,
    required this.city,
    required this.bestSeason,
    required this.type,
    required this.price,
    required this.tags,
  });

  factory DestinationDto.fromJson(Map<String, dynamic> json) {
    return DestinationDto(
      id: json['id'],
      title: json['title'],
      country: json['country'],
      image: json['posterPath'],
      rating: (json['rating'] as num).toDouble(),
      overview: json['overview'],
      city: json['city'],
      bestSeason: json['bestSeason'],
      type: json['type'],
      price: (json['priceUSD'] as num).toDouble(),
      tags: List<String>.from(json['tags'] ?? []),
    );
  }
}
