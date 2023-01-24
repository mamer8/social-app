abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginShowPasswordState extends LoginStates {
  bool ispass;
  LoginShowPasswordState({required this.ispass});
}

class OnBoardingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginStates {
  final dynamic error;
  LoginErrorState(this.error);
}

class LoginLoadingState extends LoginStates {}

class RegisterSuccessState extends LoginStates {}

class RegisterErrorState extends LoginStates {
  final dynamic error;
  RegisterErrorState(this.error);
}

class RegisterLoadingState extends LoginStates {}

class CreateUserLoadingState extends LoginStates {}

class CreateUserSuccessState extends LoginStates {}

class CreateUserErrorState extends LoginStates {
  final dynamic error;

  CreateUserErrorState(this.error);
}
