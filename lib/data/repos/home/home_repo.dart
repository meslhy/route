import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data/models/failures.dart';
import 'package:route_task/data/models/responses/data_response.dart';
import 'package:route_task/domain/repos/home/ds/home_online_ds.dart';
import 'package:route_task/domain/repos/home/home_repo.dart';
import 'package:route_task/ui/utils/constants.dart';
import 'package:route_task/ui/utils/extensions.dart';


@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo{
  Connectivity connectivity;
  HomeOnlineDs homeOnlineDS;
  HomeRepoImpl(this.connectivity,this.homeOnlineDS);
  @override
  Future<Either<Failure, DataResponse>> getData() async{
    if(await connectivity.isInternetConnective){
      return homeOnlineDS.getData();
    }else{
      return left(Failure(Constants.internetErrorMessage));
    }
  }



}