// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:easy_parking_app/app/core/src/data/domain/entities/car.dart';

// ignore: must_be_immutable
class CarModel extends CarEntity {
  int? id;
  String? plate;
  String? model;
  CarModel({
    this.id,
    this.plate,
    this.model,
  });

  factory CarModel.fromEntity(CarEntity entity) {
    int? id = int.tryParse(entity.plate!);
    return CarModel(
      id: id,
      plate: entity.plate,
      model: entity.model,
    );
  }

  CarEntity toEntity() {
    return CarEntity(
      plate: plate,
      model: model,
    );
  }

  CarModel copyWith({
    int? id,
    String? plate,
    String? model,
  }) {
    return CarModel(
      id: id ?? this.id,
      plate: plate ?? this.plate,
      model: model ?? this.model,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'plate': plate,
      'model': model,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'],
      plate: map['plate'],
      model: map['model'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) =>
      CarModel.fromMap(json.decode(source));

  @override
  String toString() => 'CarModel(id: $id, plate: $plate, model: $model)';

  @override
  List<Object?> get props => [id, plate, model];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarModel &&
        other.id == id &&
        other.plate == plate &&
        other.model == model;
  }

  @override
  int get hashCode => id.hashCode ^ plate.hashCode ^ model.hashCode;
}
