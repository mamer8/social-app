import '../../../../Login/data/models/user_model.dart';
import '../../../data/models/post_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

/// Navigation bar
class AppNavBarChangeState extends AppStates {}

/// Change language
class AppChangeLanguageState extends AppStates {}

/// App states

class AppSuccessState extends AppStates {
  final UserModel _userModelData;

  AppSuccessState(this._userModelData);
}

class AppErrorState extends AppStates {
  final dynamic error;
  AppErrorState(this.error);
}

class AppLoadingState extends AppStates {}

/// Image picker
class AppImagePickerSuccessState extends AppStates {}

class AppImagePickerErrorState extends AppStates {}

class AppImagePickerLoadingState extends AppStates {}

/// Upload Image
class AppUploadImageSuccessState extends AppStates {}

class AppUploadImageErrorState extends AppStates {}

/// Update User
class AppUpdateUserLoadingState extends AppStates {}

class AppUpdateUserSuccessState extends AppStates {}

class AppUpdateUserErrorState extends AppStates {}

//////POST/////////

class AppPostImagePickerSuccessState extends AppStates {}

class AppPostImagePickerErrorState extends AppStates {}

class AppPostImagePickerLoadingState extends AppStates {}

class AppUploadPostImageSuccessState extends AppStates {}

class AppUploadPostImageErrorState extends AppStates {}

class AppCreatePostLoadingState extends AppStates {}

class AppCreatePostSuccessState extends AppStates {}

class AppCreatePostErrorState extends AppStates {}

class AppGetPostsLoadingState extends AppStates {}

class AppGetPostsSuccessState extends AppStates {
  final List<PostModel> postModel;

  AppGetPostsSuccessState(this.postModel);
}

class AppGetPostsErrorState extends AppStates {
  final String error;

  AppGetPostsErrorState(this.error);
}

class AppLikePostSuccessState extends AppStates {}

class AppLikePostErrorState extends AppStates {
  final String error;

  AppLikePostErrorState(this.error);
}

///////////// Chat ///////////
/// Get All Users
class AppGetUsersLoadingState extends AppStates {}

class AppGetUsersSuccessState extends AppStates {}

class AppGetUsersErrorState extends AppStates {
  final String error;

  AppGetUsersErrorState(this.error);
}

/// Send Messages
class AppSendMessagesSuccessState extends AppStates {}

class AppSendMessagesErrorState extends AppStates {
  final String error;

  AppSendMessagesErrorState(this.error);
}

/// Get Messages
class AppGetMessagesSuccessState extends AppStates {}

class AppGetMessagesErrorState extends AppStates {
  final String error;

  AppGetMessagesErrorState(this.error);
}
