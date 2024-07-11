import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data/models/failures.dart';
import 'package:route_task/data/models/responses/data_response.dart';
import 'package:route_task/domain/repos/home/home_repo.dart';


@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo{
  @override
  Future<Either<Failure, DataResponse>> getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }



}