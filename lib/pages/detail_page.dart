import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stil_duragii/consts/Text_Styles.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:stil_duragii/services/get_mongo_data.dart';

class DetailPage extends StatelessWidget {
  var urun;
   DetailPage({ required this.urun});

  @override
  Widget build(BuildContext context) {
     Uint8List bytes = Base64Decoder().convert(urun['base64Image']);
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: BorderSide.strokeAlignInside,
        title: Text(urun['urun_adi']),
        actions: [ 
          IconButton(onPressed: (){
            
          }, icon: Icon(Icons.shopping_cart, color: Colors.deepPurple, size: 3.h,))
        ],
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Container(child:  ClipRRect(child: Image.memory(bytes, fit: BoxFit.cover,), borderRadius: BorderRadius.circular(10.sp),), width: 59.w, height: 35.h, decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(10.sp),
              color: Colors.amber
            ),),
          SizedBox(height: 3.h,),
          Padding(
            padding:  EdgeInsets.only(left: 20.sp, right: 5.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 productDetails(urun['urun_adi'], TextStyles.detailPageProductNameTextStyle(context)),
                 productDetails("₺ "+urun['fiyat'], TextStyles.detailPageProductPriceTextStyle(context)),
                 productDetails(urun['aciklama'], TextStyles.detailPageProductExplanationTextStyle(context)),
                 productDetails(urun['cinsiyet'], TextStyles.detailPageProductNameTextStyle(context)),
                 productDetails(urun['beden'], TextStyles.detailPageProductNameTextStyle(context)),
                 SizedBox(height: 3.h,),
                 ElevatedButton.icon(
                  onPressed: (){

                       if(Services.sepetList.contains(urun)){
                                  AnimatedSnackBar(
                             builder: ((context) {
                        return Container(
                           padding: const EdgeInsets.all(8),
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp),  color: Colors.amber,),    
                           height: 50,
                          child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          Icon(Icons.check_box, color: Colors.green,),
                          SizedBox(width: 5.sp,),
                         Text('Ürün sepete ekli'),
                       ],
                    ),
                   );
                 }),
                     ).show(context);
                        } else{ 
                          Services.sepetList.add(urun);
                          log(Services.sepetList.length.toString());
                              AnimatedSnackBar(
                          builder: ((context) {
                        return Container(
                        padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp),  color: Colors.amber,),
                          height: 50,
                        child:  Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                            Icon(Icons.check_box, color: Colors.green,),
                            SizedBox(width: 5.sp,),
                            Text('Ürün sepete başarıyla eklandi'),
                          ],
                           ),
                        );
                         }),
                           ).show(context);
                        }
                   
                       
                  }, icon: Icon(Icons.shopping_cart), label: Text('Sepete ekle'),
                  
                  
                  )
              ],
            ),
          ),
           
        ],
        
      ),

     
    );
    
  }
   Widget productDetails(String text, TextStyle textStyle){
    return Container(
      padding: EdgeInsets.all(5.sp),
      margin: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 232, 145, 174),
          Color.fromARGB(255, 176, 142, 236)
        ])
      ),
      child: Center(
        child: Text(text , style: textStyle,),
      ),
    );
   }


}