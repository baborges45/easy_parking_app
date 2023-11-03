import 'package:easy_parking_app/app/core/src/data/models/vacancy_model.dart';
import 'package:easy_parking_app/app/utils/typedef.dart';

abstract class VacancyRepository {
  const VacancyRepository();
  ResultFuture<List<VacancyModel>> fetchVacancies();
}
