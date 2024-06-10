import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:stil_duragii/consts/Text_Styles.dart';
import 'package:stil_duragii/pages/detail_page.dart';
import 'package:stil_duragii/services/get_mongo_data.dart';

class HomePageGridList extends StatefulWidget {
     final List<Map<String, dynamic>> filteredList;

  const HomePageGridList({required this.filteredList});

  @override
  State<HomePageGridList> createState() => _HomePageGridListState();
}

class _HomePageGridListState extends State<HomePageGridList> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: widget.filteredList.length,
        shrinkWrap: true,
        
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var data = widget.filteredList[index];
              Uint8List bytes = Base64Decoder().convert(data['base64Image']);
          return GestureDetector(
            child: Card(
              
            color: Colors.white,
              child: Column(
                children: [
                              Container(child:  ClipRRect(child: Image.memory(bytes, fit: BoxFit.cover,), borderRadius: BorderRadius.circular(10.sp),), width: 35.w, height: 19.h,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(data['urun_adi'], style: TextStyles.gridListCardTextStyle(context),),
                      SizedBox(width: 2.w,),
                      Text(data['fiyat'], style: TextStyles.gridListCardTextStyle(context),)
                    ],
                  ),
                
                ],
              )
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) => DetailPage(urun: data,)));
            },
          );
        }
      ),

     
     
  );
  }


}