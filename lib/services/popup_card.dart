import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

List<String> list = <String>[ '0-100','100-200', '200-300', '300-500', '500+'];
String dropdownValue = '0-100';
Future<void> showMyDialogFilter(BuildContext parentContext) async {

 

  return showDialog<void>(
    context: parentContext,
    builder: (BuildContext context) {
      return  AlertDialog(
        title:  Text('Ürün Filtrele'),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
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
                      
                        dropdownValue = value!;
                    
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
            ],
          ),
        ),
        actions: <Widget>[
             Center(
               child: TextButton(onPressed: (){
                
                Navigator.of(context, rootNavigator: true).pop();
                
                }, 
                     child: Text('Kaydet'),),
             )
        ],
      );
    },
  );
}