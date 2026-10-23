import 'package:easy_travel/features/home/application/get_destinations_use_case.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final GetDestinationsUseCase useCase;
  HomeViewModel({required this.useCase});

  List<Destination> destinations = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadDestinations() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));

    destinations = await useCase.execute();
    isLoading = false;
    notifyListeners();
  }
}
