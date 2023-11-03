import 'package:easy_parking_app/app/core/src/data/models/history_model.dart';
import 'package:easy_parking_app/app/utils/typedef.dart';

abstract class HistoryRepository {
  ResultFuture<List<HistoryModel>> fetchHistories();
  ResultFuture<HistoryModel> fetchHistoryByPlate(int id);
}
