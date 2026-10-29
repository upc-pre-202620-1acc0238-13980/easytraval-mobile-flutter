import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:flutter/material.dart';

class DestinationDetailPage extends StatelessWidget {
  const new({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height*0.25,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                destination.image,
                width: double.infinity,
                fit: BoxFit.cover
              ),
            ),
          ),
        ],
        body: Text(destination.country),
      ),
    );
  }
}
