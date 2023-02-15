import 'package:conventer/modules/login/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(Initial());
  static LoginCubit getObject(context)=>BlocProvider.of(context);
  Future<void> login({required String email , required String password})async{
    emit(Loading());
    http.post(
        Uri.parse("http://restapi.adequateshop.com/api/authaccount/login"),
        body: {
          "email":email,
          "password":password
        }
    );
    emit(Success());
  }
}