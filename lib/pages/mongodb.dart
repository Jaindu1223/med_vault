import 'dart:developer';

import 'package:med_vault/pages/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
  static connect() async{
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status =db.serverStatus();
    print(status);
    var collection =db.collection(COLLECTION_NAME);
    await collection.insertMany([{
      "username" :"1",
      "name" : "bla",
    },
      {
        "username" :"1",
        "name" : "bla",
      }
      ]);
    print(await collection.find().toList());
  }
}