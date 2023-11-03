import 'package:easy_parking_app/app/core/src/data/domain/usecases/get_vacancy.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future initLocator() async {
  locator.registerLazySingleton(() => GetVacancyUseCase(locator()));
}
