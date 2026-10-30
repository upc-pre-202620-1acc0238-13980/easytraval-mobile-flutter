import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:flutter/material.dart';

class DestinationDetailPage extends StatelessWidget {
  const new({
    super.key,
    required this.destination,
    required this.isFavorite,
    required this.onToggleFavorite,
  });
  final Destination destination;
  final bool isFavorite;
  final Function onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {
                  onToggleFavorite();
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_outline,
                ),
              ),
            ],
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: destination.id,
                child: Image.network(
                  destination.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.title,
                    style: Theme.of(context).textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    destination.country,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    destination.city,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.primary,
                        size: 16,
                      ),
                      Text(
                        destination.rating.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    destination.overview,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Season',
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    destination.bestSeason,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Type',
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    destination.type,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
