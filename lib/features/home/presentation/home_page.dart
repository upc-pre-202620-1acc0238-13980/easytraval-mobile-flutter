import 'package:easy_travel/features/home/presentation/home_view_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel viewModel;
  const new({super.key, required this.viewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadDestinations();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        HomeViewModel viewModel = widget.viewModel;

        if (viewModel.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: viewModel.destinations.length,
          itemBuilder: (context, index) => ListTile(
            leading: ClipOval(
              child: Image.network(
                viewModel.destinations[index].image,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(viewModel.destinations[index].title),
          ),
        );
      },
    );
  }
}
