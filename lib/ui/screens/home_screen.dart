import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/data/models/responses/data_response.dart';
import 'package:route_task/domain/di/di.dart';
import 'package:route_task/ui/screens/home_view_model.dart';
import 'package:route_task/ui/screens/widgets/item_widget.dart';
import 'package:route_task/ui/utils/base_request_states.dart';

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
    viewModel.getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            SizedBox(width: 5,),
            Image(image: AssetImage("assets/route_logo.png"),color: Colors.blue,width: 100,),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                          ),
                        )
                      ),
                    )
                ),
                const SizedBox(width: 10,),
                const Icon(Icons.shopping_cart_rounded,color: Colors.blue,),

              ],
            ),
            BlocBuilder(
              bloc: viewModel.getDataUseCase,
              builder: (context, state) {
                if(state is BaseRequestSuccessState){
                  List<Products> product = state.data.products;
                  return  Expanded(
                    child: GridView.builder(
                      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10),
                      itemBuilder: (context, index) => ItemWidget(product: product[index]) ,
                      itemCount: product.length,
                      padding: const EdgeInsetsDirectional.all(8),
                    
                    ),
                  );
                }else if (state is BaseRequestErrorState){
                  return Expanded(child: Center(child: Text(state.message),));
                }else{
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),

    );
  }
}
