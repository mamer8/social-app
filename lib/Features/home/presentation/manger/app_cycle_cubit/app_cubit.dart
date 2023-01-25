import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/cupertino_icons.dart';
import '../../../../../core/utils/network/local/cache_helper.dart';
import '../../../../Login/data/models/user_model.dart';
import '../../../data/models/message_model.dart';
import '../../../data/models/post_model.dart';
import '../../views/chat/chat_view.dart';
import '../../views/home/home_view_body.dart';
import '../../views/notification/notificatios_view.dart';
import '../../views/user/user_view.dart';
import 'package:flutter/cupertino.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit getobject(context) => BlocProvider.of(context);
  static AppCubit get(context) => BlocProvider.of(context);

  /// change language

  bool isEnglish = CacheHelper.getData(key: 'isEnglish') ?? true;
  void changeLanguage() {
    isEnglish = !isEnglish;
    CacheHelper.saveData(key: 'isEnglish', value: isEnglish);
    emit(AppChangeLanguageState());
  }

  /// navigation bar
  int currentIndex = 0;

  List<Widget> navigationBarViews = [
    HomeViewBody(),
    const UserViewBody(),
    ChatView(),
    // const NotificationViewBody(),
  ];

  void changeNavigationBar(int index) {
    currentIndex = index;
    print(currentIndex);
    if (currentIndex == 1) getUserData();
    if (currentIndex == 2) {
      getUsers();
      getMyPosts();
    }
    emit(AppNavBarChangeState());
  }

  /// get user data
  UserModel userModel = UserModel();
  void getUserData() {
    emit(AppLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(kUID)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(AppSuccessState(userModel));
      userModel.uId = kUID;
      print(' hhhhhhhhhhhhhhhhhhhhhhhhhhhh ${userModel.uId}');
      print(' hhhhhhhhhhhhhhhhhhhhhhhhhhhh ${userModel.name}');
    }).catchError((error) {
      print('errrrrrrrrrrror ${error.toString()}');
      emit(AppErrorState(error.toString()));
    });
  }

  /// pick profile image
  /// File: '/data/user/0/com.example.socialapp/cache/image_picker7221688221783727534.jpg'
  File? profileImage;
  var imagePicker = ImagePicker();

  getProfileImage() async {
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
      print(' lllllllllllll $profileImage');
      emit(AppImagePickerSuccessState());
    } else {
      print('no selected lllllllllllllllllllllllllll');
      emit(AppImagePickerErrorState());
    }
  }

  /// upload photo
  void uploadImage({
    required String phone,
    required String name,
    required String bio,
  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        emit(AppUploadImageSuccessState());
        print(value);
        updateUser(bio: bio, name: name, phone: phone, image: value);
      }).catchError((onError) {
        emit(AppUploadImageErrorState());
      });
    }).catchError((onError) {
      emit(AppUploadImageErrorState());
    });
  }

  /// update user

  void updateUser(
      {required String phone,
      required String name,
      required String bio,
      String? image}) {
    emit(AppUpdateUserLoadingState());
    UserModel modelData = UserModel(
        image: image ?? userModel.image,
        phone: phone,
        name: name,
        bio: bio,
        isEmailVerified: userModel.isEmailVerified,
        email: userModel.email,
        uId: kUID);
    FirebaseFirestore.instance
        .collection('users')
        .doc(kUID)
        .update(modelData.toJson())
        .then((value) {
      getUserData();
      emit(AppUpdateUserSuccessState());
    }).catchError((error) {
      emit(AppUpdateUserErrorState());
    });
  }

  //////////////////////////////////NEW POST///////////////////////////////////
  /// pick post image
  /// File: '/data/user/0/com.example.socialapp/cache/image_picker7221688221783727534.jpg'
  File? postImage;
  var imagePostPicker = ImagePicker();

  getPostImage() async {
    final pickedImage =
        await imagePostPicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      postImage = File(pickedImage.path);
      print(' lllllllllllll $postImage');
      emit(AppPostImagePickerSuccessState());
    } else {
      print('no selected lllllllllllllllllllllllllll');
      emit(AppPostImagePickerErrorState());
    }
  }

  /// upload photo
  void uploadPostImage({
    required String text,
    required String date,
  }) {
    emit(AppCreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        emit(AppUploadPostImageSuccessState());
        print(value);
        createPost(text: text, date: date, imagePost: value);
        emit(AppCreatePostSuccessState());
      }).catchError((onError) {
        emit(AppUploadPostImageErrorState());
      });
    }).catchError((onError) {
      emit(AppUploadImageErrorState());
    });
  }

  /// create post

  void createPost({
    required String text,
    String? imagePost,
    required String date,
  }) {
    emit(AppCreatePostLoadingState());
    PostModel postModel = PostModel(
        image: userModel.image,
        name: userModel.name,
        postImage: imagePost ?? '',
        text: text,
        date: date,
        uId: kUID);
    FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.toJson())
        .then((value) {
      getPosts();
      emit(AppCreatePostSuccessState());
    }).catchError((error) {
      emit(AppCreatePostErrorState());
    });
  }

  /// get posts

  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];

  void getPosts() {
    posts = [];
    postsId = [];
    likes = [];
    emit(AppGetPostsLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('date')
        .get()
        .then((value) {
      // posts.clear();

      for (var element in value.docs) {
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
        }).catchError((e) {});
        posts.add(PostModel.fromJson(element.data()));
        postsId.add(element.id);
      }

      print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk $posts');
      emit(AppGetPostsSuccessState(posts));
    }).catchError((e) {
      emit(AppGetPostsErrorState(e.toString()));
    });
  }

  /// get my posts

  List<PostModel> myposts = [];
  List<String> mypostsId = [];
  List<int> mylikes = [];

  void getMyPosts() {
    myposts = [];
    mypostsId = [];
    mylikes = [];
    emit(AppGetMyPostsLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('date')
        .get()
        .then((value) {
      // posts.clear();

      for (var element in value.docs) {
        if (userModel.uId == element.id) {
          element.reference.collection('likes').get().then((value) {
            likes.add(value.docs.length);
          }).catchError((e) {});
          posts.add(PostModel.fromJson(element.data()));
          postsId.add(element.id);
        }
      }

      print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk $myposts');
      emit(AppGetMyPostsSuccessState(myposts));
    }).catchError((e) {
      emit(AppGetMyPostsErrorState(e.toString()));
    });
  }

  /// like post

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel.uId)
        .set({'like': true})
        .then((value) {})
        .catchError((e) {});
    //emit(AppLikePostSuccessState());
  }

  /// get users

  List<UserModel> users = [];

  void getUsers() {
    emit(AppGetUsersLoadingState());
    users.clear();
    FirebaseFirestore.instance.collection('users').get().then((value) {
      for (var element in value.docs) {
        if (userModel.uId != element.id) {
          users.add(UserModel.fromJson(element.data()));
        }
      }

      emit(AppGetUsersSuccessState());
    }).catchError((e) {
      emit(AppGetUsersErrorState(e.toString()));
    });
  }

  /////////////// Chat ////////////

  void sendMessage(
      {required String text,
      required String date,
      required String receiverId}) {
    MessageModel messageModel = MessageModel(
        text: text,
        date: date,
        receiverId: receiverId,
        senderId: userModel.uId);

    /// send my chat
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(messageModel.toJson())
        .then((value) {
      emit(AppSendMessagesSuccessState());
    }).catchError((e) {
      emit(AppSendMessagesErrorState(e.toString()));
    });
    getMessage(receiverId: receiverId);

    /// send receiver chat
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel.uId)
        .collection('messages')
        .add(messageModel.toJson())
        .then((value) {
      emit(AppSendMessagesSuccessState());
    }).catchError((e) {
      emit(AppSendMessagesErrorState(e.toString()));
    });
  }

  /// Get Messages
  List<MessageModel> messages = [];
  void getMessage({required String receiverId}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('date')
        .snapshots()
        .listen((event) {
      messages = [];
      for (var element in event.docs) {
        messages.add(MessageModel.fromJson(element.data()));
      }
      print('fffffffffffffffffffffffff');
      emit(AppGetMessagesSuccessState());
    });
  }
}
