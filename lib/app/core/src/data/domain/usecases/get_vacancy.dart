import 'package:easy_parking_app/app/core/src/data/domain/entities/vacancy.dart';
import 'package:easy_parking_app/app/core/src/data/domain/repositories/vacancy_repository.dart';
import 'package:easy_parking_app/app/utils/typedef.dart';
import 'package:easy_parking_app/app/utils/usecase.dart';

class GetVacancyUseCase extends UseCaseWithoutParams<List<VacancyEntity>> {
  const GetVacancyUseCase(this._repository);
  final VacancyRepository _repository;

  @override
  ResultFuture<List<VacancyEntity>> call() async =>
      _repository.fetchVacancies();
}
