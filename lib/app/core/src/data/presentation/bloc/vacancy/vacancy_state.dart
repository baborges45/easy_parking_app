// ignore_for_file: overridden_fields

import 'package:easy_parking_app/app/core/src/data/domain/entities/history.dart';
import 'package:easy_parking_app/app/core/src/data/domain/entities/vacancy.dart';
import 'package:equatable/equatable.dart';

class ParkingLotState extends Equatable {
  const ParkingLotState({this.vacancy});
  final VacancyEntity? vacancy;

  @override
  List<Object?> get props => [vacancy];
}

class ParkingLotStateInitial extends ParkingLotState {
  const ParkingLotStateInitial();
}

class ParkingLotStateLoading extends ParkingLotState {
  const ParkingLotStateLoading();
}

class ParkingLotStateLoaded extends ParkingLotState {
  const ParkingLotStateLoaded(
    this.vacancy, {
    List<HistoryEntity>? history,
    List<HistoryEntity>? exitHistory,
  })  : _addHistory = history ?? const [],
        _exitHistory = exitHistory ?? const [];

  @override
  final VacancyEntity vacancy;
  final List<HistoryEntity> _addHistory;
  final List<HistoryEntity> _exitHistory;

  List<HistoryEntity> get addHistory => _addHistory;
  List<HistoryEntity> get exitHistory => _exitHistory;
}

class ParkingLotStateError extends ParkingLotState {
  const ParkingLotStateError(this.message);
  final String message;
}
