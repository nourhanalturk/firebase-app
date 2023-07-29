import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/cubit/login_cubit/states.dart';
import 'package:firebase_app/cubit/sign_cubit/states.dart';
import 'package:firebase_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(InitState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required name,
    required email,
    required phone,
    required password,
}){
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.uid);
      userCreate(
          name: name,
         email: email,
         phone: phone,
         uId: value.user!.uid
      );
      emit(UserRegisterSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(UserRegisterSuccessState());
    });


  }

  void userCreate( {
  required name,
  required email,
  required phone,
  required uId,
}){
    UserModel userModel = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
          emit(CreateUserSuccessState());
           })
        .catchError((error){
          emit(CreateUserErrorState());
          });
  }

}