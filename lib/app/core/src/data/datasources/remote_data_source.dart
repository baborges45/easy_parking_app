import 'package:easy_parking_app/app/core/errors/exception.dart';
import 'package:easy_parking_app/app/core/src/data/models/vacancy_model.dart';
import 'package:easy_parking_app/app/utils/dummy_data.dart';

abstract class RemoteDataSource {
  Future<List<VacancyModel>> getRecommendCourses();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();

  @override
  Future<List<VacancyModel>> getRecommendCourses() async {
    // Todo: implement the call to real api
    try {
      // dummy data
      return vagas.map((e) => VacancyModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
