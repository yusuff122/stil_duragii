import 'package:flutter/material.dart';
import 'package:stil_duragii/pages/my_home_page.dart';
import 'package:sizer/sizer.dart';
import 'package:stil_duragii/services/get_mongo_data.dart';

void main() async{
  await Services.getData();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
   return  Sizer(       builder: (context, orientation, deviceType) {             
       return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
       home:  MyHomePage(),
        );
      } 
      );
   
  }
}
