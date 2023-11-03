// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields
import 'dart:convert';

import 'package:easy_parking_app/app/core/src/data/domain/entities/vacancy.dart';
import 'package:easy_parking_app/app/core/src/data/models/car_model.dart';
import 'package:easy_parking_app/app/utils/typedef.dart';

// ignore: must_be_immutable
class VacancyModel extends VacancyEntity {
  VacancyModel({
    this.id,
    super.number,
    this.occupied = false,
    this.car,
    this.slotName,
    this.time,
  });

  int? id;
  int? number;
  bool? occupied;
  CarModel? car;
  String? slotName;
  DateTime? time;

  factory VacancyModel.fromEntity(VacancyEntity entity) {
    int? id = int.tryParse(entity.number.toString());
    return VacancyModel(
      id: id,
      number: entity.number,
    );
  }

  VacancyEntity toEntity() {
    return VacancyEntity(
      number: number,
    );
  }

  VacancyModel copyWith({
    int? id,
    int? number,
    bool? occupied,
    CarModel? car,
    String? slotName,
    String? time,
  }) {
    return VacancyModel(
      id: id ?? this.id,
      number: number ?? this.number,
      occupied: occupied ?? this.occupied,
      car: car ?? this.car,
      slotName: slotName ?? this.slotName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'occupied': occupied,
      'car': car?.toMap(),
      'slotName': slotName,
      'time': time,
    };
  }

  VacancyModel.fromMap(DataMap map)
      : this(
          id: map['id'],
          number: map['number'],
          occupied: false,
          car: CarModel.fromMap(map['car']),
          slotName: map['slotName'],
          time: map['time'],
        );

  String toJson() => json.encode(toMap());

  factory VacancyModel.fromJson(String source) =>
      VacancyModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'VacancyModel(id: $id, number: $number, occupied: $occupied)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VacancyModel &&
        other.id == id &&
        other.number == number &&
        other.occupied == occupied;
  }

  @override
  int get hashCode => id.hashCode ^ number.hashCode ^ occupied.hashCode;
}
