import 'package:easy_travel/core/app_database.dart';
import 'package:easy_travel/features/favorites/application/get_favorites_use_case.dart';
import 'package:easy_travel/features/favorites/application/toggle_favorite_use_case.dart';
import 'package:easy_travel/features/favorites/domain/favorite_repository.dart';
import 'package:easy_travel/features/favorites/infrastructure/favorite_dao.dart';
import 'package:easy_travel/features/favorites/infrastructure/favorite_repository_impl.dart';
import 'package:easy_travel/features/home/application/get_destinations_use_case.dart';
import 'package:easy_travel/features/home/domain/destination_repository.dart';
import 'package:easy_travel/features/home/infrastructure/destination_repository_impl.dart';
import 'package:easy_travel/features/home/infrastructure/remote/destination_api.dart';
import 'package:easy_travel/features/home/presentation/home_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getIt.registerLazySingleton<FavoriteDao>(
    () => FavoriteDao(appDatabase: getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(dao: getIt<FavoriteDao>()),
  );

  getIt.registerLazySingleton<GetFavoritesUseCase>(
    () => GetFavoritesUseCase(repository: getIt<FavoriteRepository>()),
  );

  getIt.registerLazySingleton<ToggleFavoriteUseCase>(
    () => ToggleFavoriteUseCase(repository: getIt<FavoriteRepository>()),
  );

  getIt.registerLazySingleton<DestinationApi>(() => DestinationApi());

  getIt.registerLazySingleton<DestinationRepository>(
    () => DestinationRepositoryImpl(api: getIt<DestinationApi>()),
  );

  getIt.registerLazySingleton<GetDestinationsUseCase>(
    () => GetDestinationsUseCase(repository: getIt<DestinationRepository>()),
  );

  getIt.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(
      getDestinations: getIt<GetDestinationsUseCase>(),
      getFavorites: getIt<GetFavoritesUseCase>(),
      toggleFavorite: getIt<ToggleFavoriteUseCase>(),
    ),
  );
}
