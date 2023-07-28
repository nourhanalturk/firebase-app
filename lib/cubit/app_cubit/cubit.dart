import 'package:bloc/bloc.dart';
import 'package:firebase_app/cubit/app_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(InitState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentBottomNavIndex =0;
  void changeBottomNavBar(int index){
    currentBottomNavIndex =index;
    emit(ChangeBottomNavBarIndexState());
  }

}