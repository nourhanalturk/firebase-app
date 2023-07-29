import 'package:firebase_app/cubit/sign_cubit/cubit.dart';
import 'package:firebase_app/cubit/sign_cubit/states.dart';
import 'package:firebase_app/layout/layout_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sharing/component/component.dart';
import '../style/colors/colors.dart';
import '../style/iconBroken/iconBroken.dart';
import '../style/loginWave/loginWaveStyle.dart';
import 'login_screen.dart';


class SignScreen extends StatelessWidget {
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var name = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context, state) {
      if (state is CreateUserSuccessState){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LayoutScreen(),),
                (Route <dynamic>route) => false);
      }
        },
        builder: (context, state) {
          return Scaffold(
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
                              height: 20.0,
                            ),
                            defaultText(
                                text: 'Sign Up',
                                fontSize: 35.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            SizedBox(height: 50.0),
                            defaultTextFormField(
                                controller: name,
                                hint: 'Name',
                                prefix: IconBroken.User,
                                textInputType: TextInputType.name

                            ),
                            SizedBox(height: 20.0),
                            defaultTextFormField(
                                controller: email,
                                hint: 'Email',
                                prefix: IconBroken.Profile,
                                textInputType: TextInputType.emailAddress

                            ),
                            SizedBox(height: 20.0),
                            defaultTextFormField(
                                controller: password,
                                hint: 'Password',
                                prefix: IconBroken.Lock,
                                textInputType: TextInputType.number


                            ),
                            SizedBox(height: 20.0),
                            defaultTextFormField(
                                controller: phone,
                                hint: 'phone',
                                prefix: IconBroken.Call,
                                textInputType: TextInputType.number
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
                                  RegisterCubit.get(context).userRegister(
                                      name: name.text,
                                      email: email.text,
                                      phone: phone.text,
                                      password: password.text
                                  );
                                },
                                child: defaultText(text: 'Sign', fontSize: 16, color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 50.0),
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
                        defaultText(text: 'Do you have an account? ', fontSize: 15.0, color: Colors.black),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

                          },
                          child: defaultText(text: 'Login', fontSize: 15.0, color: Colors.orange),
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
