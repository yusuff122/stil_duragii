import 'package:flutter/material.dart';

class TextStyles{

   static TextStyle gridListCardTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 16,   color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle gridListCardPriceTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 16,   color: Colors.deepOrange,
      fontWeight: FontWeight.bold,
    );
  }
    static TextStyle detailPageProductNameTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 20,   color: Colors.black,
     
    );
  }

   static TextStyle detailPageProductPriceTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 20,  color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }


  static TextStyle detailPageProductExplanationTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 15,  color: Colors.black,
    );
  }
  static TextStyle shoppingPageProductNameTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 14,  color: Colors.black,
    );
  }

   static TextStyle communicationPageSendMessageTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 20,  color: Colors.black,
      fontFamily: 'ozel'
    );
  }

  static TextStyle aboutPageAboutTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 35,  color: Colors.black,
      fontFamily: 'ozel',
    
    );
  }

  static TextStyle aboutPageNeotericTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 17,  color: Colors.black,
    );
  }
  static TextStyle aboutPageTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 13,  color: Colors.black,
      fontWeight: FontWeight.bold
    
    );
  }

  static TextStyle aboutPage2TextStyle(BuildContext context){
    return TextStyle(
      fontSize: 13,  color: Colors.black,
      
    
    );
  }
  static TextStyle aboutPageIletisimButtonTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 15,  color: Colors.white,
      fontFamily: 'ozel',
    
    );
  }
}