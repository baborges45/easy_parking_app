// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_parking_app/app/core/src/data/models/car_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class VacancyEntity extends Equatable {
  int? id;
  int? number;
  bool? occupied;
  String? slotName;
  DateTime? time;
  CarModel? car;
  VacancyEntity({
    this.id,
    this.number,
    this.occupied = false,
    this.slotName,
    this.time,
    this.car,
  });

  @override
  List<Object?> get props => [number];
}
