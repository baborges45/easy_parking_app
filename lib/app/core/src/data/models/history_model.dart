import 'package:easy_parking_app/app/core/src/data/domain/entities/history.dart';
import 'package:easy_parking_app/app/core/src/data/models/vacancy_model.dart';

class HistoryModel {
  int? id;
  String? placa;
  String? modelo;
  DateTime? dataHora;
  bool? entrada;
  VacancyModel? vaga;
  DateTime? dataHoraSaida;

  HistoryModel({
    this.id,
    this.placa,
    this.modelo,
    this.dataHora,
    this.entrada = true,
    this.vaga,
    this.dataHoraSaida,
  });

  factory HistoryModel.fromEntity(HistoryEntity history) {
    return HistoryModel(
      placa: history.plate,
      modelo: history.model,
      dataHora: history.dateTime,
      entrada: history.entry,
    );
  }

  HistoryEntity toEntity() {
    return HistoryEntity(
      plate: placa,
      model: modelo,
      dateTime: dataHora,
      entry: entrada,
    );
  }

  HistoryModel copyWith({
    int? id,
    String? placa,
    String? modelo,
    DateTime? dataHora,
    bool? entrada,
    VacancyModel? vaga,
    DateTime? dataHoraSaida,
  }) {
    return HistoryModel(
      id: id ?? this.id,
      placa: placa ?? this.placa,
      modelo: modelo ?? this.modelo,
      dataHora: dataHora ?? this.dataHora,
      entrada: entrada ?? this.entrada,
      vaga: vaga ?? this.vaga,
      dataHoraSaida: dataHoraSaida ?? this.dataHoraSaida,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'placa': placa,
      'modelo': modelo,
      'dataHora': dataHora,
      'entrada': entrada,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      id: map['id'],
      placa: map['placa'],
      modelo: map['modelo'],
      dataHora: map['dataHora'],
      entrada: map['entrada'],
    );
  }

  @override
  String toString() {
    return 'HistoryModel(id: $id, placa: $placa, modelo: $modelo, dataHora: $dataHora, entrada: $entrada)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HistoryModel &&
        other.id == id &&
        other.placa == placa &&
        other.modelo == modelo &&
        other.dataHora == dataHora &&
        other.entrada == entrada;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        placa.hashCode ^
        modelo.hashCode ^
        dataHora.hashCode ^
        entrada.hashCode;
  }

  HistoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        placa = json['placa'],
        modelo = json['modelo'],
        dataHora = json['dataHora'],
        entrada = json['entrada'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'placa': placa,
        'modelo': modelo,
        'dataHora': dataHora,
        'entrada': entrada,
      };
}
