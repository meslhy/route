import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data/models/failures.dart';
import 'package:route_task/data/models/responses/data_response.dart';
import 'package:route_task/domain/repos/home/ds/home_online_ds.dart';


@Injectable(as: HomeOnlineDs)
class HomeOnlineDsImpl extends HomeOnlineDs{

  @override
  Future<Either<Failure, DataResponse>> getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }


}