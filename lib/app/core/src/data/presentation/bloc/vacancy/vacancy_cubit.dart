import 'package:easy_parking_app/app/core/src/data/domain/entities/history.dart';
import 'package:easy_parking_app/app/core/src/data/domain/entities/vacancy.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_event.dart';
import 'package:easy_parking_app/app/core/src/data/presentation/bloc/vacancy/vacancy_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParkingLotCubit extends Bloc<VacancyEvent, ParkingLotState> {
  //final ParkingRepository parkingRepository;
  final List<VacancyEntity> vacancys = [];
  final List<HistoryEntity> history = [];
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
      vacancys.remove(event.vacancy);
      exitHistory.add(
        HistoryEntity(
          plate: event.vacancy.car!.plate!,
          exitTime: DateTime.now(),
        ),
      );
    } else {
      vacancys.add(event.vacancy);
      history.add(HistoryEntity(
        plate: event.vacancy.car!.plate!,
        dateTime: DateTime.now(),
      ));
      print('Entradas: $history');
      print('Saídas: $exitHistory');
    }
    emit(ParkingLotStateLoaded(event.vacancy, history: history));
  }

  bool _checkVacancyExist(VacancyEntity course) {
    return vacancys.contains(course.id ?? '');
  }

  Future<void> _onVacancyUnoccupied(
      VacancyUnoccupied event, Emitter<ParkingLotState> emit) async {
    emit(const ParkingLotStateLoading());
    event.vacancy.occupied = !event.vacancy.occupied!;
    if (_checkVacancyExist(event.vacancy)) {
      vacancys.remove(event.vacancy);
      exitHistory.add(
        HistoryEntity(
          plate: event.vacancy.car!.plate!,
          exitTime: DateTime.now(),
        ),
      );
      print('Entradas: $history');
      print('Saídas: $exitHistory');
    } else {
      vacancys.add(event.vacancy);
      history.add(HistoryEntity(
        plate: event.vacancy.car!.plate!,
        dateTime: DateTime.now(),
      ));
      print('Entradas: $history');
      print('Saídas: $exitHistory');
    }
    emit(ParkingLotStateLoaded(event.vacancy, history: history));
  }

  void setVacancy(VacancyEntity vacancy) {
    emit(ParkingLotState(
      vacancy: vacancy,
    ));
  }

  VacancyEntity get vacancy => state.vacancy!;

  // void registerEntry(CarModel car) {
  //   parkingRepository.registerEntry(car);
  //   emit(ParkingLotState(parkingRepository.parkingLot.spots));
  // }

  // void registerExit(ParkingSlot slot) {
  //   parkingRepository.registerExit(slot.vacancy.car!.plate!);
  //   emit(ParkingLotState(parkingRepository.parkingLot.spots));
  // }
}
