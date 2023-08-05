abstract class LoginStates {}
class initstate extends LoginStates {}
class UserLoginLoadingState extends LoginStates {}

class UserLoginSuccessState extends LoginStates {
  final String uId;

  UserLoginSuccessState(this.uId);

}
class UserLoginErrorState extends LoginStates {}



