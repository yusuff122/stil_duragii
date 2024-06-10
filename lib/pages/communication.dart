import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:stil_duragii/consts/Text_Styles.dart';

class Communication extends StatefulWidget {
   Communication({super.key});

  @override
  State<Communication> createState() => _CommunicationState();
}

class _CommunicationState extends State<Communication> {
   String dropdownValue = "Şikayet";

     List<String> list = <String>['Şikayet', 'öneri'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          height: 65.h,
          width: MediaQuery.of(context).size.width-10.w,
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: Colors.white
         ),
         child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(8.0.sp),
              child: Text("Bize mesaj gönder", style: TextStyles.communicationPageSendMessageTextStyle(context),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.sp, right: 40.sp, top: 16.sp),
              child: TextField(
                
                decoration: InputDecoration(
                      hintText: 'isim soyisim',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                    ),
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(left: 40.sp, right: 40.sp, top: 16.sp),
              child: TextField(
                
                decoration: InputDecoration(
                      hintText: 'mail adresi',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                    ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16.sp, bottom: 16.sp),
              width: 64.w,
             
              child: Row(
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
                    items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                       value: value,
                       child: Text(value),
                          );
                      }).toList(),
                               ),
                  ),
                ],
              ),
            ),
            Padding(
                  padding: EdgeInsets.only(left: 25.sp, right: 25.sp, top: 16.sp),
              child: TextFormField(
                    minLines: 4, 
                    
                    keyboardType: TextInputType.multiline,
                     maxLines: null,
                     decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.amber,
                      hintText: 'Mesajnızı buraya yazın'
                      ),
                     
              ),
            ),

            Padding(padding: EdgeInsets.all(8.sp), 
            child: ElevatedButton.icon(onPressed: (){
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
                   Text('Mesajınız gönderildi'),
                  ],
               ),
              );
         }),
          ).show(context);

            }, icon: Icon(Icons.send), label: Text('Gönder'))
             ,)
          ],
         )
        ),
      ),
    );
  }
}