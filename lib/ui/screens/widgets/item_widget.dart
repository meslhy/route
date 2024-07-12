import 'package:flutter/material.dart';
import 'package:route_task/data/models/responses/data_response.dart';

class ItemWidget extends StatelessWidget {

  Products product;
   ItemWidget({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width:MediaQuery.of(context).size.width *0.4 ,
        height:MediaQuery.of(context).size.height *0.22,

        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.lightBlue,

            ),
            borderRadius: BorderRadiusDirectional.circular(10)
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Expanded(
                child: Image(
                  image: NetworkImage(
                    product.images![0],
                  ),

                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    product.title??"",
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 12
                    ),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${product.price??0.00}",
                        style: const TextStyle(
                            fontSize: 12
                        ),
                      ),
                      Text(
                        "${product.price??0.00}",
                        style: const TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.lightBlueAccent
                        ),

                      ),
                      const SizedBox(width: 5,)
                    ],
                  ),
                  Row(

                    children: [
                       Text(
                        "Review (${product.rating??0})",
                        style: const TextStyle(
                            fontSize: 12
                        ),
                      ),
                      const Icon(Icons.star,color: Colors.yellow,),
                      const Spacer(),
                      const CircleAvatar(
                        child: Icon(Icons.add,color: Colors.white,),
                        backgroundColor: Colors.blue,
                        minRadius: double.minPositive,
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
