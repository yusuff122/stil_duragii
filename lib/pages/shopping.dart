import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stil_duragii/consts/Text_Styles.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:stil_duragii/pages/detail_page.dart';
import 'package:stil_duragii/services/get_mongo_data.dart';
class Shopping extends StatefulWidget {
   Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
   final heights = [
  25.h,

];

final colors = [
  Colors.orange,
  Colors.amberAccent,
  Colors.yellow,
  Colors.lightGreenAccent,
  Colors.lightGreen,
  Colors.green,
  Colors.greenAccent,
  Colors.lightBlueAccent,
  Colors.blue,
];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("Sepetim ",style:  TextStyles.detailPageProductNameTextStyle(context),), 
        centerTitle: true,
        actions: [
            Row(
              
            children: [
              
              Icon(Icons.shopping_cart, color: Color.fromARGB(255, 212, 149, 13), size: 4.h,)
            ],
          ),
        ],
      ),

      body: Services.sepetList.isNotEmpty ? DynamicHeightGridView(
          
          itemCount: Services.sepetList.length,
          crossAxisCount: 2,
          builder: (ctx, index) {
            colors.shuffle();
            heights.shuffle();
            return Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp), color: colors.first,),
              height: heights.first.toDouble(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                   Container(padding: EdgeInsets.only(left: 10.sp,) ,child:  ClipRRect(child: Image.memory(Base64Decoder().convert(Services.sepetList[index]['base64Image']), fit: BoxFit.cover,), borderRadius: BorderRadius.circular(10.sp),), width: 50.w, height: 19.h,),            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){

                        Services.sepetList.removeAt(index);
                        setState(() {
                          Services.sepetList;
                        });
                            AnimatedSnackBar(
                builder: ((context) {
                   return Container(
                     padding:  EdgeInsets.all(8),
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp),  color: Colors.amber,),

           
                height: 10.h,
               child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_box, color: Colors.green,),
                      SizedBox(width: 5.sp,),
                   Text('Ürün sepeten kaldırıldı'),
                  ],
               ),
              );
         }),
          ).show(context);
                      }, icon: Icon(Icons.delete), color: Colors.red.shade400, iconSize: 4.h,),
                      Container(
                        height: 4.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10.sp)
                        ),
                        
                        child: Center(child: Text(Services.sepetList[index]['urun_adi'], style:TextStyles.shoppingPageProductNameTextStyle(context) ,)),
                        )
                    ],
                  ),
             

                ],
                
              ),
            );
          },
        ) : Center(child: Text('Sepete ürün bulunmuyor', style: TextStyle(fontSize: 12.sp),),)
        
       
      );

    
  }
}