import 'package:easy_parking_app/app/core/src/data/domain/entities/history.dart';
import 'package:easy_parking_app/app/core/src/data/domain/entities/vacancy.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_event.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ParkingLotCubit extends Bloc<VacancyEvent, ParkingLotState> {
  final List<VacancyEntity> vacancys = [];
  final List<HistoryEntity> addHistory = [];
  final List<HistoryEntity> exitHistory = [];

  ParkingLotCubit() : super(const ParkingLotStateInitial()) {
    on<VacancyOccupied>(_onVacancyOccupied);
    on<VacancyUnoccupied>(_onVacancyUnoccupied);
  }

  Future<void> _onVacancyOccupied(
      VacancyOccupied event, Emitter<ParkingLotState> emit) async {
    emit(const ParkingLotStateLoading());
    event.vacancy.occupied = true;
    if (_checkVacancyExist(event.vacancy)) {
      exitHistory.add(
        HistoryEntity(
          plate: event.vacancy.car!.plate!,
          model: event.vacancy.car!.model!,
          exitTime: DateTime.now(),
        ),
      );
    } else {
      addHistory.add(HistoryEntity(
        plate: event.vacancy.car!.plate!,
        model: event.vacancy.car!.model!,
        dateTime: DateTime.now(),
      ));
    }
    emit(ParkingLotStateLoaded(event.vacancy, history: addHistory));
  }

  Future<void> _onVacancyUnoccupied(
      VacancyUnoccupied event, Emitter<ParkingLotState> emit) async {
    emit(const ParkingLotStateLoading());
    event.vacancy.occupied = false;
    if (!_checkVacancyExist(event.vacancy)) {
      vacancys.remove(event.vacancy);
      exitHistory.add(
        HistoryEntity(
          plate: event.vacancy.car!.plate!,
          model: event.vacancy.car!.model!,
          exitTime: DateTime.now(),
        ),
      );
      emit(ParkingLotStateLoaded(event.vacancy,
          history: addHistory, exitHistory: exitHistory));
    }
  }

  bool _checkVacancyExist(VacancyEntity vacancy) {
    return vacancys.any((v) => v.id == vacancy.id && v.occupied!);
  }

  void setVacancy(VacancyEntity vacancy) {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(ParkingLotState(
      vacancy: vacancy,
    ));
  }

  VacancyEntity get vacancy => state.vacancy!;

  String getFormattedDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    String formatted = formatter.format(now);
    return formatted;
  }
}
