import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class  StorageServices{

  final storage =  FlutterSecureStorage();
  static const emailKey = "Email Key";
  static const passKey = "Pass Key";
  static const tokenKey = "Token Key";
  static const userNameKey = "User Name Key";

  storeEmail(String email)async{
    await storage.write(key: emailKey, value: email);
  }

  Future<String?> getEmail()async{
    return storage.read(key: emailKey);
  }

  storePass(String password)async{
    await storage.write(key: passKey, value: password);
  }

  Future<String?> getPass()async{
    return storage.read(key: passKey);
  }

  storeUserName(String username)async{
    await storage.write(key: userNameKey, value: username);
  }
  Future<String?> getUserName()async{
    return storage.read(key: userNameKey);
  }


  storeToken(String token)async{
    await storage.write(key: tokenKey, value: token);
  }
  Future<String?> getToken()async{
    return storage.read(key: tokenKey);
  }


  removeEmailAndPass()async{
    await storage.delete(key: emailKey);
    await storage.delete(key: passKey);
  }

}