// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class HistoryEntity extends Equatable {
  String? plate;
  String? model;
  DateTime? dateTime;
  DateTime? exitTime;
  bool? entry;
  bool? exit;
  HistoryEntity({
    this.plate,
    this.model,
    this.dateTime,
    this.entry,
    this.exitTime,
    this.exit,
  });

  @override
  List<Object?> get props => [plate, model, dateTime, entry];
}
