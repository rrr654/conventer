import 'package:conventer/layout/home_screen.dart';
import 'package:conventer/modules/login/login_screen.dart';
import 'package:conventer/modules/register/cubit/cubit.dart';
import 'package:conventer/modules/register/cubit/states.dart';
import 'package:conventer/shared/components/custom_button.dart';
import 'package:conventer/shared/components/custom_statefull_text_field.dart';
import 'package:conventer/shared/components/custom_stateless_text_field.dart';
import 'package:conventer/shared/components/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterStates>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_sharp,
                        size: 25,
                        color: Color(0xffE5E2E2FF),
                      ),
                      SizedBox(width: 15,),
                      Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: const [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white10,
                        child: Icon(
                          Icons.person_outline_rounded,
                          size: 80,
                          color: Color(0xffE5E2E2FF),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 30),
                        child: CircleAvatar(
                          radius: 17.5,
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: Color(0xffE5E2E2FF),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35,),
                  CustomStatelessTextField(
                    controller: name,
                    lableText: "Name",
                  ),
                  const SizedBox(height: 16,),
                  CustomStatelessTextField(
                    controller: email,
                    lableText: "Email",
                  ),
                  const SizedBox(height: 16,),
                  CustomStateFullTextField(
                    controller: pass,
                    text: "Password",
                  ),
                  const SizedBox(height: 30,),
                  CustomButton(onPressed: (){
                    RegisterCubit.get(context).register(context ,name.text,email.text,pass.text);
                  }, text: "Register", minWidth: double.infinity),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey
                        ),
                      ),
                      const SizedBox(width: 2),
                      CustomTextButton(onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(
                          builder: (context) => LoginScreen(),),
                                (route) => false);
                      }, text: "Login")
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {

        },
    );
  }

}
