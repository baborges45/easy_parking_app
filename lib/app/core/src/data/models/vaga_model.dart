// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VagaModel {
  int? slotId;
  String? slotName;
  String? time;
  bool? isParked;
  bool? isBooked;
  VagaModel({
    this.slotId,
    this.slotName,
    this.time,
    this.isParked,
    this.isBooked,
  });

  VagaModel copyWith({
    int? slotId,
    String? slotName,
    String? time,
    bool? isParked,
    bool? isBooked,
  }) {
    return VagaModel(
      slotId: slotId ?? this.slotId,
      slotName: slotName ?? this.slotName,
      time: time ?? this.time,
      isParked: isParked ?? this.isParked,
      isBooked: isBooked ?? this.isBooked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'slotId': slotId,
      'slotName': slotName,
      'time': time,
      'isParked': isParked,
      'isBooked': isBooked,
    };
  }

  factory VagaModel.fromMap(Map<String, dynamic> map) {
    return VagaModel(
      slotId: map['slotId'] != null ? map['slotId'] as int : null,
      slotName: map['slotName'] != null ? map['slotName'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
      isParked: map['isParked'] != null ? map['isParked'] as bool : null,
      isBooked: map['isBooked'] != null ? map['isBooked'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VagaModel.fromJson(String source) =>
      VagaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VagaModel(slotId: $slotId, slotName: $slotName, time: $time, isParked: $isParked, isBooked: $isBooked)';
  }

  @override
  bool operator ==(covariant VagaModel other) {
    if (identical(this, other)) return true;

    return other.slotId == slotId &&
        other.slotName == slotName &&
        other.time == time &&
        other.isParked == isParked &&
        other.isBooked == isBooked;
  }

  @override
  int get hashCode {
    return slotId.hashCode ^
        slotName.hashCode ^
        time.hashCode ^
        isParked.hashCode ^
        isBooked.hashCode;
  }
}
