import 'package:bloc/bloc.dart';
import 'package:firebase_app/cubit/login_cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(initstate());
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin(
  {
    required email ,
    required password
  })
   {
     emit(UserLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.uid);
      emit(UserLoginSuccessState(value.user!.uid));
    }).catchError((error){
      emit(UserLoginErrorState());
    });
}

}