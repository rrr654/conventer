import 'dart:convert';

import 'package:conventer/layout/cubit/cubit.dart';
import 'package:conventer/layout/cubit/states.dart';
import 'package:conventer/models/currency_model.dart';
import 'package:conventer/shared/components/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color color1 = Colors.orange;
  Color color2 = Colors.green;
  Color backGround = Colors.black45;

  String selectedBaseCode = "";
  String selectedBaseName = "EURO";
  String selectedCountryCode = "";
  String selectedCountryName = "US Dollar";
  String selectedCountrySymbol = "£";
  String convertedValue = "0.0";
  bool isLoading = false;
  bool isButtonLoading = false;

  @override
  void initState() {
    HomeCubit.getObject(context).allCurrencies().then((value) {
      setState(() {
        isLoading = false;
      });
    }).catchError((onError) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.getObject(context);
        return Scaffold(
          backgroundColor: backGround,
          body: isLoading ?
          Center(
            child: CircularProgressIndicator(color: color1,),
          )
              :
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        customCont(
                            text1: selectedBaseName.toUpperCase(),
                            text2: "1 $selectedCountrySymbol",
                            color: color1,
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (ctx) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 16),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        )
                                    ),
                                    height: 700,
                                    child: ListView.separated(
                                      itemCount: cubit.currencies.length,
                                      itemBuilder: (context, index) {
                                        return
                                          ListTile(
                                            onTap: () {
                                              selectedBaseCode =
                                              cubit.currencies[index].code!;
                                              selectedCountrySymbol =
                                              cubit.currencies[index].symbol!;
                                              selectedBaseName =
                                              cubit.currencies[index].name!;
                                              Navigator.pop(context);
                                              setState(() {});
                                            },
                                            leading: Text(
                                              cubit.currencies[index].code!,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            trailing: Text(
                                                cubit.currencies[index]
                                                    .symbol!),
                                            title: Text(
                                                cubit.currencies[index].name!),
                                          );
                                      },
                                      separatorBuilder: (BuildContext context,
                                          int index) {
                                        return const Divider(
                                          color: Colors.blue,
                                        );
                                      },

                                    ),
                                  );
                                },
                              );
                            }
                        ),
                        const SizedBox(height: 15,),
                        customCont(
                          text1: selectedCountryName.toUpperCase(),
                          text2: convertedValue,
                          color: color2,
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (ctx) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 16),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      )
                                  ),
                                  height: 700,
                                  child: ListView.separated(
                                    itemCount: cubit.currencies.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {
                                          selectedCountryCode =
                                          cubit.currencies[index].code!;
                                          selectedCountryName =
                                          cubit.currencies[index].name!;
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        leading: Text(
                                          cubit.currencies[index].code!,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        trailing: Text(
                                            cubit.currencies[index].symbol!),
                                        title: Text(
                                            cubit.currencies[index].name!),
                                      );
                                    },
                                    separatorBuilder: (BuildContext context,
                                        int index) {
                                      return const Divider(
                                        color: Colors.blue,
                                      );
                                    },

                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.autorenew_rounded,
                          size: 35,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                isButtonLoading ?
                Center(
                  child: CircularProgressIndicator(color: color1,),
                ) :
                InkWell(
                  onTap: () {
                    setState(() {
                      isButtonLoading = true;
                    });
                    cubit.convert(selectedBaseCode, selectedCountryCode).then((
                        value) {
                      setState(() {
                        convertedValue = value;
                        isButtonLoading = false;
                      });
                    });
                  },
                  child: Container(
                    width: 400,
                    height: 80,
                    decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.send,
                          size: 35,
                          color: Colors.white,
                        ),
                        SizedBox(width: 11),
                        Text(
                          "Convert",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: 400,
                  height: 80,
                  decoration: BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.history,
                        size: 35,
                        color: Colors.white,
                      ),
                      SizedBox(width: 11),
                      Text(
                        "Historical Data",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    //https://api.freecurrencyapi.com/v1/latest?apikey=tnOw2tbUyZNc1NoBHdMPEojXkCO87EC2JzdrT2sd&currencies=&base_currency=EUR


  }
}