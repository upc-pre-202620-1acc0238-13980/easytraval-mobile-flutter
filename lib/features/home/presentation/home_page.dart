import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:easy_travel/features/home/presentation/destination_card.dart';
import 'package:easy_travel/features/home/presentation/home_view_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomeViewModel viewModel;
  const new({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        if (viewModel.state.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return Expanded(
          child: ListView.builder(
            itemCount: viewModel.state.destinations.length,
            itemBuilder: (context, index) {
              Destination destination = viewModel.state.destinations[index];
              return DestinationCard(destination: destination);
            },
          ),
        );
      },
    );
  }
}
