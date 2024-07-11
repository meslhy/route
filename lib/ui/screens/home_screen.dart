import 'package:flutter/material.dart';
import 'package:route_task/domain/di/di.dart';
import 'package:route_task/ui/screens/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar:AppBar(
        leading: Image(image: AssetImage("assets/route_logo.png")),
      ),

    );
  }
}
