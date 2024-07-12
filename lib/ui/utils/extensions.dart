import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

extension ConnectivityExtension on Connectivity{

  Future<bool> get isInternetConnective async{

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)) {
     return true;
    } else {
      return false;
    }
  }
}

extension ScreenPercentage on num{
  double h(BuildContext context ){
    return MediaQuery.of(context).size.height *this;
  }

  double w(BuildContext context ){
    return MediaQuery.of(context).size.width *this;
  }
}