import 'package:mongo_dart/mongo_dart.dart';
import 'dart:developer';
class Services{
 static List list = [];
 static List sepetList = []; 

static getData()async{
  var db = await Db.create("mongodb+srv://barulayyusuf960:v24xIU0kaIZWCOU9@cluster0.rxpqdzd.mongodb.net/myDatabase?retryWrites=true&w=majority&appName=Cluster0");
  await db.open();
 
  var collection = db.collection('products');

  var allDocs = await collection.find().toList();
   await db.close();
  log(allDocs.isEmpty.toString());
  list = allDocs;
 
}

}

