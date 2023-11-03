import 'package:dartz/dartz.dart';
import 'package:easy_parking_app/app/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef DataMap = Map<String, dynamic>;
