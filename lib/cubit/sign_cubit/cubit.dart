import 'package:bloc/bloc.dart';
import 'package:firebase_app/cubit/login_cubit/states.dart';
import 'package:firebase_app/cubit/sign_cubit/states.dart';
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

      emit(createUserSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(createUserErrorState());
    });


  }

}