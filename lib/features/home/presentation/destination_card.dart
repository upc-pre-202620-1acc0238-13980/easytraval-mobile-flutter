import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  const new({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: Hero(
              tag: destination.id,
              child: Image.network(destination.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  destination.country,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  destination.city,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  spacing: 4,
                  children: [
                    Icon(Icons.star, color: Theme.of(context).colorScheme.primary, size: 16),
                    Text(
                      destination.rating.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}