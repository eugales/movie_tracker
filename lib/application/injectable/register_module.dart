import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule { 
  @singleton
  FirebaseDatabase get database => FirebaseDatabase.instance;

  @preResolve 
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();  
} 