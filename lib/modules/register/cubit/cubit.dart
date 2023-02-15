import 'package:conventer/layout/home_screen.dart';
import 'package:conventer/modules/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(InitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);

  Future<void> register(context,em,pas,name)async{
    emit(Loading());
    http.post(
        Uri.parse("http://restapi.adequateshop.com/api/authaccount/registration"),
        body: {
          "name":name,
          "email":em,
          "password":pas
        }
    ).then((value) {
      emit(Success());
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => const HomeScreen(),),
              (route) => false);
    });
  }
}