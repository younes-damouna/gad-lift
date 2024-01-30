import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_app/helpers/config/base_dio.dart';
import 'package:mobile_app/helpers/constants/api_constants.dart';

abstract class AuthService {
  static Future login(String email, String password) async {
    try {
      final response = await dio.post(ApiRoutes.login, data: {
        "email": email,
        "password": password,
      });
     
      return {
        "user": response.data['user'],
        "statusCode": response.statusCode,
        'access_token': response.data['access_token']
      };

     
    } on DioException catch (e) {
      return {
        "response": "",
        "statusCode": e.response?.statusCode,
        "statusMessage": e.response?.data['message']
      };
    }
  }

  static Future register(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      final response = await dio.post(ApiRoutes.register, data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
      });
     

      return response.statusCode;
    } on DioException catch (e) {
      return e.response?.statusCode;
    }
  }

  static Future googleSignIn() async {
    const List<String> scopes = <String>[
      'email',
      'profile',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];

    GoogleSignIn googleSignIn = GoogleSignIn(
    
      scopes: scopes,
    );

    try {      log("fired");
    await  googleSignIn.signOut();

      final GoogleSignInAccount? user=await googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth=await user!.authentication;
      // final credential=GoogleAuthProvider.credential(accessToken:googleAuth.accessToken ,idToken:googleAuth.idToken ,);
      final names=user.displayName?.split(' ');
     final res= await register(names![0], names![1], user.email, user.id);
     if(res==200){
     return await login(user.email,user.id);
     }else{
       return await login(user.email,user.id);
     }
      //  return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      log('$error');
    }
  }
}
