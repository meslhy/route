import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data/models/failures.dart';
import 'package:route_task/data/models/responses/data_response.dart';
import 'package:route_task/domain/repos/home/ds/home_online_ds.dart';
import 'package:http/http.dart';
import 'package:route_task/ui/utils/constants.dart';


@Injectable(as: HomeOnlineDs)
class HomeOnlineDsImpl extends HomeOnlineDs{

  @override
  Future<Either<Failure, DataResponse>> getData() async {
    try{
      Uri url = Uri.parse("https://dummyjson.com/products");

      Response serverResponse = await get(url);

      DataResponse response = DataResponse.fromJson(jsonDecode(serverResponse.body));

      if(serverResponse.statusCode >=200 &&serverResponse.statusCode <300){
        return right(response);
      }else{
        return left(Failure(Constants.defaultErrorMessage));
      }

    }catch(e,ee){
      print(ee);
      return left(Failure(e.toString()));
    }
  }


}