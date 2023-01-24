import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/user_model.dart';
import 'login_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit getobject(context) => BlocProvider.of(context);

  bool isPassword = true;

  void togglePassword() {
    isPassword = !isPassword;
    emit(LoginShowPasswordState(ispass: isPassword));
  }

  //
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('oooooooooooooooooo ${value.user!.uid}');
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  //// Register
  void userRegister({
    required String email,
    required String name,
    required String phone,
    required String password,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu ${value.user!.uid}');
      userCreate(name: name, email: email, phone: phone, uID: value.user!.uid);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print('ffffffffffffffffffffffff${error.toString()}');
      emit(RegisterErrorState(error.toString()));
    });
  }

  //// Create user
  void userCreate({
    required String email,
    required String name,
    required String phone,
    String? bio = '',
    String image = kDefaultImage,
    required String uID,
  }) {
    emit(CreateUserLoadingState());
    UserModel model = UserModel(
      phone: phone,
      email: email,
      image: image,
      bio: bio,
      name: name,
      uId: uID,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .set(model.toJson())
        .then((value) {
      // print(value.!.email);
      // print(value.user!.uid);

      emit(CreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }
}
