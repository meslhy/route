import 'package:dartz/dartz.dart';
import 'package:route_task/data/models/failures.dart';
import 'package:route_task/data/models/responses/data_response.dart';

abstract class HomeRepo {
  Future<Either<Failure,DataResponse>> getData();
}