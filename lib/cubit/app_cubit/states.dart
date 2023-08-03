abstract class AppStates {}
class InitState extends AppStates {}
class ChangeBottomNavBarIndexState extends AppStates {}
class GetHomeDataSuccessState extends AppStates {}
class GetHomeDataErrorState extends AppStates {
  final error;
  GetHomeDataErrorState(this.error);
}

class GetFeedDataSuccessState extends AppStates {}
class GetFeedDataErrorState extends AppStates {
  final error;
  GetFeedDataErrorState(this.error);
}

class ChangeSelectedHomeButtonState extends AppStates{}

class CreateNewRecipeLoadingState extends AppStates {}
class CreateNewRecipeSuccessState extends AppStates {}
class CreateNewRecipeErrorState extends AppStates {
  final error;
  CreateNewRecipeErrorState(this.error);
}
class RecipeImagePickedSuccessState extends AppStates {}
class RecipeImagePickedErrorState extends AppStates {}

class GetUserModelDataLoadingState extends AppStates{}
class GetUserModelDataSuccessState extends AppStates{}
class GetUserModelDataErrorState extends AppStates{
  final error;
  GetUserModelDataErrorState(this.error);
}

class UploadRecipeImageLoadingState extends AppStates{}
class UploadRecipeImageSuccessState extends AppStates{}
class UploadRecipeImageErrorState extends AppStates{}



