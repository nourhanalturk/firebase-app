import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_app/cubit/login_cubit/cubit.dart';
import 'package:firebase_app/cubit/login_cubit/states.dart';
import 'package:firebase_app/layout/layout_screen.dart';
import 'package:firebase_app/modules/sign_up_screen.dart';
import 'package:firebase_app/network/local/shared_preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sharing/component/component.dart';
import '../sharing/constance.dart';
import '../style/colors/colors.dart';
import '../style/iconBroken/iconBroken.dart';
import '../style/loginWave/loginWaveStyle.dart';


class LoginScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) =>LoginCubit() ,
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {
  if (state is UserLoginSuccessState){


    CacheHelper.saveData(key: 'uId',
        value: state.uId)
        .then((value) {
           uId = CacheHelper.getData(key: 'uId');
          print(uId);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LayoutScreen(),),
              (Route <dynamic>route) => false);
    });
  }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false, // Set resizeToAvoidBottomInset to false
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: crispyGradient,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80.0,
                            ),
                            defaultText(
                                text: 'Login',
                                fontSize: 35.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            SizedBox(height: 50.0),
                            defaultTextFormField(
                              controller: email,
                              hint: 'Email',
                              prefix: IconBroken.Profile,
                              textInputType: TextInputType.emailAddress
                              // validator: (String? value){
                              //   if(value!.isEmpty){
                              //     return 'email must not be empty ';}
                              //   return null ;
                              // }
                            ),
                            SizedBox(height: 20.0),
                            defaultTextFormField(
                              controller: password,
                              hint: 'Password',
                              prefix: IconBroken.Lock,
                                textInputType: TextInputType.number
                              // validator: (String? value){
                              //   if(value!.isEmpty){
                              //     return 'email must not be empty ';}
                              //   return null ;
                              // }
                            ),

                            SizedBox(height: 50.0),
                            Container(
                              height: 50.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white10,
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  LoginCubit.get(context).userLogin(email: email.text, password: password.text);
                                },
                                child: defaultText(text: 'Login', fontSize: 16, color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 50.0),
                            TextButton(
                                onPressed: () {},
                                child: defaultText(text: 'Forgot your password ?', fontSize: 16.0, color: Colors.white)),
                            SizedBox(height: 180.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultText(text: 'Don\'t have an account? ', fontSize: 15.0, color: Colors.black),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignScreen(),));
                          },
                          child: defaultText(text: 'Sign Up', fontSize: 15.0, color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

  }

}
