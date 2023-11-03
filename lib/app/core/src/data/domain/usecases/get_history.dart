import 'package:easy_parking_app/app/core/src/data/models/history_model.dart';
import 'package:easy_parking_app/app/core/src/data/domain/repositories/history_repository.dart';
import 'package:easy_parking_app/app/utils/typedef.dart';

abstract class GetHistory {
  const GetHistory(this._repository);
  final HistoryRepository _repository;

  //@override
  ResultFuture<List<HistoryModel>> call() async => _repository.fetchHistories();
  Future<void> registerHistory(HistoryModel history);
}
