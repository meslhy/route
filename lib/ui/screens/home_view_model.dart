import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/domain/use_cases/get_data_use_case.dart';
import 'package:route_task/ui/utils/base_request_states.dart';

@injectable
class HomeViewModel extends Cubit{

  GetDataUseCase getDataUseCase;

  HomeViewModel(this.getDataUseCase):super(BaseRequestInitialState());

  getData(){
    return getDataUseCase.execute();
  }

}