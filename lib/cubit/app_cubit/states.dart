abstract class AppStates {}
class InitState extends AppStates {}
class ChangeBottomNavBarIndexState extends AppStates {}
class GetHomeDataSuccessState extends AppStates {}
class GetHomeDataErrorState extends AppStates {
  final error;
  GetHomeDataErrorState(this.error);
}


