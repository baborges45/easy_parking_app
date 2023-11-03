// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CarEntity extends Equatable {
  String? plate;
  String? model;
  CarEntity({
    this.plate,
    this.model,
  });

  @override
  List<Object?> get props => [plate, model];
}
