import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:conventer/layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


import '../../models/currency_model.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(InitialState());
  static HomeCubit getObject(context)=>BlocProvider.of(context);
  List<CurrencyModel> currencies =[];
  Future<String> convert(String base,String currency)async{
    Uri uri= Uri(
      scheme: "https",
      host: "api.freecurrencyapi.com",
      path: "v1/latest",
      queryParameters: {
        "apikey":"tnOw2tbUyZNc1NoBHdMPEojXkCO87EC2JzdrT2sd",
        "currencies":currency,
        "base_currency" :base
      },
    );
    var response = await http.get(uri);
    if(response.statusCode==200){
      var decodedBody = json.decode(response.body) as Map<String,dynamic>;
      num rate  = decodedBody["data"][currency];
      return rate.toStringAsFixed(2);
    }else{
      return "Error";
    }

  }
  Future allCurrencies()async{
    // setState(() {
    //   isLoading = true;
    // });true
    Uri uri= Uri(
      scheme: "https",
      host: "api.freecurrencyapi.com",
      path: "v1/currencies",
      queryParameters: {
        "apikey":"tnOw2tbUyZNc1NoBHdMPEojXkCO87EC2JzdrT2sd",
        "currencies":"",
      },
    );
    var response = await http.get(uri);
    if(response.statusCode==200){
      var decodedBody = json.decode(response.body) as Map<String,dynamic>;
      Map<String,dynamic> mappedCountries = decodedBody["data"];

      currencies =  mappedCountries.entries.map(
              (e) => CurrencyModel.fromJson(e.value as Map<String,dynamic>)
      ).toList();
    }else{
      return [];
    }
  }
}