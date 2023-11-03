import 'package:dartz/dartz.dart';
import 'package:easy_parking_app/app/core/errors/exception.dart';
import 'package:easy_parking_app/app/core/errors/failure.dart';
import 'package:easy_parking_app/app/core/src/data/datasources/remote_data_source.dart';
import 'package:easy_parking_app/app/core/src/data/domain/entities/vacancy.dart';
import 'package:easy_parking_app/app/core/src/data/domain/repositories/vacancy_repository.dart';
import 'package:easy_parking_app/app/core/src/data/models/vacancy_model.dart';
import 'package:easy_parking_app/app/utils/typedef.dart';

class ParkingRepositoryImpl extends VacancyRepository {
  const ParkingRepositoryImpl(this._dataSourceImpl);

  final RemoteDataSourceImpl _dataSourceImpl;

  ResultFuture<List<VacancyEntity>> getRecommendCourses() async {
    try {
      final result = await _dataSourceImpl.getRecommendCourses();
      return Right(result);
    } on ServerException {
      return const Left(
        ServerFailure(message: 'failed to connect to server', statusCode: 400),
      );
    }
  }

  @override
  ResultFuture<List<VacancyModel>> fetchVacancies() {
    throw UnimplementedError();
  }

  @override
  ResultFuture<VacancyModel> fetchVacancy(int id) {
    throw UnimplementedError();
  }
}
