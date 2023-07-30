import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/cubit/app_cubit/states.dart';
import 'package:firebase_app/modules/add_screen.dart';
import 'package:firebase_app/modules/feedback_screen.dart';
import 'package:firebase_app/modules/home_screen.dart';
import 'package:firebase_app/modules/profile_screen.dart';
import 'package:firebase_app/modules/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/home_model.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(InitState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentBottomNavIndex =0;
  void changeBottomNavBar(int index){
    currentBottomNavIndex =index;
    emit(ChangeBottomNavBarIndexState());
  }
  List<Widget>screen =[
    HomeScreen(),
    SearchScreen(),
    AddScreen(),
    FeedbackScreen(),
    ProfileScreen()
  ];

  List<HomeModel> breakfastInfo =[];
  List<String> breakfastId =[];
  List<int> likes =[];

  void getHomeData(){
    FirebaseFirestore.instance
        .collection('home')
        .get()
        .then((value){
      value.docs.forEach((element) {
        breakfastId.add(element.id);
        breakfastInfo.add(HomeModel.fromJson(element.data()));
      });
      emit(GetHomeDataSuccessState());
      //print( breakfastInfo[1].uId);


    })
        .catchError((error){
      emit(GetHomeDataErrorState(error.toString()));
      print(error.toString());
    });
  }

  bool homeButtonIngredients = false;
  bool homeButtonRecipe = false;
  String buttonIdentifier = 'Ingredients';


  void changeSelectedHomeButton(String buttonIdentifier) {
    this.buttonIdentifier = buttonIdentifier ;
    if (buttonIdentifier == 'Ingredients') {
      homeButtonIngredients = true;
      homeButtonRecipe = false;
    } else if (buttonIdentifier == 'Recipe') {
      homeButtonIngredients = false;
      homeButtonRecipe = true;
    }
    emit(ChangeSelectedHomeButtonState());
  }


}