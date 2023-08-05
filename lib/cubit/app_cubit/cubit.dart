import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/cubit/app_cubit/states.dart';
import 'package:firebase_app/models/user_model.dart';
import 'package:firebase_app/modules/add_screen.dart';
import 'package:firebase_app/modules/feedback_screen.dart';
import 'package:firebase_app/modules/home_screen.dart';
import 'package:firebase_app/modules/profile_screen.dart';
import 'package:firebase_app/modules/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/feed_model.dart';
import '../../models/home_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../sharing/constance.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() :super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentBottomNavIndex = 0;


  int profilePublication =0;
  int profileFollowing =0;
  int profileFollowers =0;

  void changeBottomNavBar(int index) {
    if(index==3){
      if(feed.isEmpty)
      getFeedData();
    }
    currentBottomNavIndex = index;
    emit(ChangeBottomNavBarIndexState());
  }

  List<Widget>screen = [
    HomeScreen(),
    SearchScreen(),
    AddScreen(),
    FeedbackScreen(),
    ProfileScreen()
  ];

  UserModel? userModel;

  void getUserData() {
    emit(GetUserModelDataLoadingState());
    print('this is the uId $uId');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      print(value.data());
      emit(GetUserModelDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserModelDataErrorState(error.toString()));
    });
  }

  List<HomeModel> breakfastInfo = [];
  List<String> breakfastId = [];

  void getHomeData() {
    FirebaseFirestore.instance
        .collection('home')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        breakfastId.add(element.id);
        breakfastInfo.add(HomeModel.fromJson(element.data()));
      });
      emit(GetHomeDataSuccessState());
      //print( breakfastInfo[1].uId);
      for(int i=0;i<breakfastInfo.length ;i++ ){
      if(userModel!.uId ==breakfastInfo[i].userUid )
        profilePublication = breakfastInfo.length;
      }

    })
        .catchError((error) {
      emit(GetHomeDataErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<FeedModel> feed = [];

  void getFeedData() {
    FirebaseFirestore.instance
        .collection('feed')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        breakfastId.add(element.id);
        feed.add(FeedModel.fromJson(element.data()));
      });
      emit(GetFeedDataSuccessState());
      //print( breakfastInfo[1].uId);
    })
        .catchError((error) {
      emit(GetFeedDataErrorState(error.toString()));
      print(error.toString());
    });
  }

  bool homeButtonIngredients = false;
  bool homeButtonRecipe = false;
  String buttonIdentifier = 'Ingredients';

  void changeSelectedHomeButton(String buttonIdentifier) {
    this.buttonIdentifier = buttonIdentifier;
    if (buttonIdentifier == 'Ingredients') {
      homeButtonIngredients = true;
      homeButtonRecipe = false;
    } else if (buttonIdentifier == 'Recipe') {
      homeButtonIngredients = false;
      homeButtonRecipe = true;
    }
    emit(ChangeSelectedHomeButtonState());
  }


  File? recipeImage;
  final picker = ImagePicker();
  Future<void> getRecipeImage() async
  {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      recipeImage = File(pickedFile.path);
      final String referencePath = 'home/${Uri.file(recipeImage!.path).pathSegments.last}';
      emit(RecipeImagePickedSuccessState());
    } else {
      emit(RecipeImagePickedErrorState());
    }
  }

  void uploadRecipeImage({
    required String breakfastDesc,
    String? breakfastImg,
    required String ingredient1Amount,
    required String ingredient2Amount,
    required String ingredient3Amount,
    required String recipe,
    required String time,
  }) async {
    emit(UploadRecipeImageLoadingState());
    try {
      final uploadTaskSnapshot = await firebase_storage.FirebaseStorage
          .instance
          .ref()
          .child('home/${Uri.file(recipeImage!.path).pathSegments.last}')
          .putFile(recipeImage!);

      final downloadUrl = await uploadTaskSnapshot.ref.getDownloadURL();
      String recipeUid = FirebaseFirestore.instance.collection('home').doc().id;

      final homeModel = HomeModel(
        breakfastDesc: breakfastDesc,
        breakfastImg: downloadUrl,
        userUid: userModel!.uId,
        name:userModel!.name ,
        calories: ingredient1Amount,
        fats:ingredient2Amount,
        proteins:ingredient3Amount,
        time: time,
        recipe: recipe,
        uId: recipeUid,
      );
      await FirebaseFirestore.instance.collection('home').add(homeModel.toMap());

      emit(UploadRecipeImageSuccessState());
    } catch (error) {
      print(error.toString());
      emit(UploadRecipeImageErrorState());
    }
  }

  List<HomeModel> favoriteRecipes = [];


  void addFavoriteRecipe(HomeModel recipe)  {
    favoriteRecipes.add(recipe);
    emit(AddFavoriteRecipeState());
  }

  List<HomeModel> publishedRecipes = [];
  void addPublishedRecipe(HomeModel model)  {
    publishedRecipes.add(model);
    emit(AddPublishedRecipeState());
  }

  List followingId = [];
  void addToFollowing(HomeModel model){
  followingId.add(model.userUid);
  profileFollowing++ ;
  emit(AddToFollowingState());
  }

}







