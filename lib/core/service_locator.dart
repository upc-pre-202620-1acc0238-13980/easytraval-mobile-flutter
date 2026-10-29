import 'package:easy_travel/features/home/application/get_destinations_use_case.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';
import 'package:easy_travel/features/home/infrastructure/destination_repository_impl.dart';
import 'package:easy_travel/features/home/infrastructure/remote/destination_api.dart';
import 'package:easy_travel/features/home/presentation/home_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<DestinationApi>(() => DestinationApi());

  getIt.registerLazySingleton<DestinationRepository>(
    () => DestinationRepositoryImpl(api: getIt<DestinationApi>()),
  );
  
  getIt.registerLazySingleton<GetDestinationsUseCase>(
    () => GetDestinationsUseCase(repository: getIt<DestinationRepository>()),
  );

  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(useCase: getIt<GetDestinationsUseCase>()),
  );
}
