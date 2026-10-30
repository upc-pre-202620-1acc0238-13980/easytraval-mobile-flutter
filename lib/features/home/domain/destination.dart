class Destination {
  final int id;
  final String title;
  final String country;
  final String image;
  final double rating;
  final double price;
  final List<String> tags;
  final String overview;
  final String city;
  final String bestSeason;
  final String type;

  const new({
    required this.id,
    required this.title,
    required this.country,
    required this.image,
    required this.rating,
    required this.price,
    required this.tags,
    required this.overview,
    required this.city,
    required this.bestSeason,
    required this.type,
  });

}
