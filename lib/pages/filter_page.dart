import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stil_duragii/consts/Text_Styles.dart';
import 'package:stil_duragii/pages/my_home_page.dart';
import 'package:stil_duragii/services/get_mongo_data.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> listDropDown = <String>['Tümü', '0-100','100-200', '200-300', '300-500', '500+'];
     String dropdownValue = 'Tümü';

List<String> listDropDownUrun = <String>[ 'Tümü','Çorap', 'eşofman', 'Gömlek', 'Kazak', 'Pantolon'];
     String dropdownValueUrun = 'Tümü';

     List<String> listDropDownBeden = <String>[ 'Tümü','Bay', 'Bayan', 'Unisex'];
     String dropdownValueBeden = 'Tümü';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          height: 60.h,
          width: MediaQuery.of(context).size.width-10.w,
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: Colors.white
         ),
         child: Column(
          
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0.sp),
              child: Text("Ürün filtrele", style: TextStyles.communicationPageSendMessageTextStyle(context),),
            ),
          
            
       
            Container(
              padding: EdgeInsets.only(top: 16.sp, bottom: 16.sp),
              width: 64.w,
             
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Fiyat aralığı seçiniz'),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                  
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          hint: Text("konu seçiniz"),
                          disabledHint: Text("Konu seçiniz"),
                          
                          icon:  Padding(
                            padding:  EdgeInsets.only(left: 100.sp),
                            child: Icon(Icons.arrow_drop_down_outlined, size: 5.h,),
                          ),
                         elevation: 16,
                                  style:  TextStyle(color: Colors.deepPurple),
                                   underline: Container(
                         height: 1.sp,
                        
                         color: Colors.black26,
                        ),
                        onChanged: (String? value) {
                         setState(() {
                            dropdownValue = value!;
                         });
                        },
                        items: listDropDown.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value),
                              );
                          }).toList(),
                                   ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
           
            Container(
              padding: EdgeInsets.only(top: 16.sp, bottom: 16.sp),
              width: 64.w,
             
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kategori seçiniz"),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                  
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: dropdownValueUrun,
                          hint: Text("konu seçiniz"),
                          disabledHint: Text("Konu seçiniz"),
                          
                          icon:  Padding(
                            padding:  EdgeInsets.only(left: 100.sp),
                            child: Icon(Icons.arrow_drop_down_outlined, size: 5.h,),
                          ),
                         elevation: 16,
                                  style:  TextStyle(color: Colors.deepPurple),
                                   underline: Container(
                         height: 1.sp,
                        
                         color: Colors.black26,
                        ),
                        onChanged: (String? value) {
                         setState(() {
                            dropdownValueUrun = value!;
                         });
                        },
                        items: listDropDownUrun.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value),
                              );
                          }).toList(),
                                   ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 16.sp, bottom: 16.sp),
              width: 64.w,
             
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Cinsiyet seçiniz"),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                  
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: dropdownValueBeden,
                          hint: Text("konu seçiniz"),
                          disabledHint: Text("Konu seçiniz"),
                          
                          icon:  Padding(
                            padding:  EdgeInsets.only(left: 100.sp),
                            child: Icon(Icons.arrow_drop_down_outlined, size: 5.h,),
                          ),
                         elevation: 16,
                                  style:  TextStyle(color: Colors.deepPurple),
                                   underline: Container(
                         height: 1.sp,
                        
                         color: Colors.black26,
                        ),
                        onChanged: (String? value) {
                         setState(() {
                            dropdownValueBeden = value!;
                         });
                        },
                        items: listDropDownBeden.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value),
                              );
                          }).toList(),
                                   ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 16.sp),
            child: ElevatedButton.icon(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) => MyHomePage(),));
            }, icon: Icon(Icons.send), label: Text('Gönder'))
            )
          ],
         )
        ),
      ),
    );
  }
}