import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:stil_duragii/consts/Text_Styles.dart';
import 'package:stil_duragii/pages/communication.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [Padding(
          padding:  EdgeInsets.all(8.sp),
          child: Text("NEOTERİC",style: TextStyles.aboutPageNeotericTextStyle(context),),
        )],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h,),
          Padding(
            padding:  EdgeInsets.only(left: 15.sp),
            child: Text("ABOUT", style: TextStyles.aboutPageAboutTextStyle(context),),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding:  EdgeInsets.all(8.sp),
            child: Text("STİL DURAĞI OLARAK, YILLARIN TECRÜBESİ İLE SİZ DEĞERLİ MÜŞTERİLERİMİZE EN YENİ TRENDLERİ, ŞIKLIĞI VE KONFORU SUNMAYI HEDEFLİYORUZ.",
                    style: TextStyles.aboutPageTextStyle(context),
            ),
          ),
          SizedBox(height: 3.h,),
          Padding(
            padding:  EdgeInsets.all(8.sp),
            child: Text("Vizyonumuz, modayı herkes için erişilebilir kılmak ve müşterilerimizin kendilerini en iyi şekilde ifade etmelerine yardımcı olmaktır. Misyonumuz ise en yüksek kalite standartlarını koruyarak, her sezon en güncel ve trend ürünleri sunmak, müşteri memnuniyetini her şeyin üzerinde tutmak ve alışveriş deneyimini keyifli hale getirmektir.",
                    style: TextStyles.aboutPage2TextStyle(context),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 15.sp, top: 20.sp, bottom: 22.sp),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => (Communication()),));
              }, child: Text("İLETİŞİM", style:TextStyles.aboutPageIletisimButtonTextStyle(context) ,)
              ),
          ),
          Expanded(
            child: Container(
              width: double.infinity
              
              ,child: Image.asset("images/toplanti.jpeg")
            ),
          ),
          
        ],
      ),
    );
  }
}