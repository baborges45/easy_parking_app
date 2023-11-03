import 'package:easy_parking_app/app/core/src/data/models/car_model.dart';
import 'package:easy_parking_app/app/core/src/data/models/history_model.dart';
import 'package:easy_parking_app/app/core/src/data/models/vacancy_model.dart';

List vagas = [
  VacancyModel(
    id: 1,
    number: 1,
    occupied: false,
    slotName: 'A1',
    time: DateTime.now(),
    car: null,
  ),
  VacancyModel(
    id: 2,
    number: 2,
    occupied: false,
    slotName: 'A2',
    time: DateTime.now(),
    car: null,
  ),
  VacancyModel(
    id: 3,
    number: 3,
    occupied: false,
    slotName: 'A3',
    time: DateTime.now(),
    car: null,
  ),
  VacancyModel(
    id: 4,
    number: 4,
    occupied: false,
    slotName: 'A4',
    time: DateTime.now(),
    car: null,
  ),
  VacancyModel(
    id: 5,
    number: 5,
    occupied: false,
    slotName: 'A5',
    time: DateTime.now(),
    car: null,
  ),
  VacancyModel(
    id: 6,
    number: 6,
    occupied: false,
    slotName: 'A6',
    time: DateTime.now(),
    car: null,
  ),
  VacancyModel(
    id: 7,
    number: 7,
    occupied: false,
    slotName: 'A7',
    time: DateTime.now(),
    car: null,
  ),
  VacancyModel(
    id: 8,
    number: 8,
    occupied: false,
    slotName: 'A8',
    time: DateTime.now(),
    car: null,
  ),
  VacancyModel(
    id: 9,
    number: 9,
    occupied: false,
    slotName: 'A9',
    time: DateTime.now(),
    car: null,
  ),
  VacancyModel(
    id: 10,
    number: 10,
    occupied: false,
    slotName: 'A10',
    time: DateTime.now(),
    car: null,
  ),
];

List<CarModel> veiculos = [
  CarModel(plate: 'AAA-1234'),
  CarModel(plate: 'BBB-5678'),
  CarModel(plate: 'CCC-9012'),
];

List<HistoryModel>? historicoEntradaSaida = [
  HistoryModel(
    id: 1,
    placa: 'AAA-1234',
    //veiculo: veiculos[0],
    dataHora: DateTime.now(),
    dataHoraSaida: null,
  ),
  HistoryModel(
    id: 2,
    placa: 'BBB-5678',
    //veiculo: veiculos[1],
    dataHora: DateTime.now(),
    dataHoraSaida: null,
  ),
  HistoryModel(
    id: 3,
    placa: 'CCC-9012',
    //veiculo: veiculos[2],
    dataHora: DateTime.now(),
    dataHoraSaida: null,
  ),
];
