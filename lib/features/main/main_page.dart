import 'package:easy_travel/features/home/application/get_destinations_use_case.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';
import 'package:easy_travel/features/home/infrastructure/destination_repository_impl.dart';
import 'package:easy_travel/features/home/infrastructure/remote/destination_api.dart';
import 'package:easy_travel/features/home/presentation/home_page.dart';
import 'package:easy_travel/features/home/presentation/home_view_model.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const new({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final DestinationApi api;
  late final DestinationRepository repository;
  late final GetDestinationsUseCase useCase;
  late final HomeViewModel viewModel;
  int selectedIndex = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    api = DestinationApi();
    repository = DestinationRepositoryImpl(api: api);
    useCase = GetDestinationsUseCase(repository: repository);
    viewModel = HomeViewModel(useCase: useCase);
    pages = [
      HomePage(viewModel: viewModel),
      Text('Favorites'),
      Text('Profile'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorites'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
