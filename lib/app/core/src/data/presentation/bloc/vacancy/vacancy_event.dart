import 'package:easy_parking_app/app/core/src/data/domain/entities/vacancy.dart';
import 'package:equatable/equatable.dart';

sealed class VacancyEvent extends Equatable {
  const VacancyEvent();

  @override
  List<Object> get props => [];
}

class VacancyOccupied extends VacancyEvent {
  const VacancyOccupied(this.vacancy);

  final VacancyEntity vacancy;

  @override
  List<Object> get props => [vacancy];
}

class VacancyUnoccupied extends VacancyEvent {
  const VacancyUnoccupied(this.vacancy);

  final VacancyEntity vacancy;

  @override
  List<Object> get props => [vacancy];
}
