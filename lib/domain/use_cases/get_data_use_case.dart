import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data/models/responses/data_response.dart';
import 'package:route_task/domain/repos/home/home_repo.dart';
import 'package:route_task/ui/utils/base_request_states.dart';

@injectable
class GetDataUseCase extends Cubit{

  HomeRepo homeRepo;

  GetDataUseCase(this.homeRepo):super(BaseRequestInitialState());

  execute()async{

    Either either = await homeRepo.getData();

    either.fold(
        (failure) =>emit(BaseRequestErrorState(failure.errorMessage)) ,
        (data) => emit(BaseRequestSuccessState<DataResponse>(data: data)),
    );
  }


}