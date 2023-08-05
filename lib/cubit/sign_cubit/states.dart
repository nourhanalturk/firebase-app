abstract class RegisterStates {}
class InitState extends RegisterStates {}
class UserRegisterLoadingState extends RegisterStates {}
class UserRegisterSuccessState extends RegisterStates {}
class UserRegisterErrorState extends RegisterStates {}

class CreateUserSuccessState extends RegisterStates {
  final uId;

  CreateUserSuccessState(this.uId);
}
class CreateUserErrorState extends RegisterStates {}




