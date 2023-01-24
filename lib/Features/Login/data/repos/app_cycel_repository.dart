// import 'package:dio/dio.dart';
// import 'package:either_dart/either.dart';
// import 'package:ordo/app/api/dio_client.dart';
// import 'package:ordo/app/api/errors/server_error.dart';
// import 'package:ordo/app/constants/strings.dart';
// import 'package:ordo/app/local/casheHelper.dart';
// import 'package:ordo/data/model/get_all_lessons_responce.dart';
// import 'package:ordo/data/model/get_all_levels_responce.dart';
// import 'package:ordo/data/model/get_all_subject_responce.dart';
// import 'package:ordo/data/model/get_lessons_details_responce.dart';
// import 'package:ordo/data/model/get_level_exam_responce.dart';
// import 'package:ordo/data/model/login_model_responce.dart';
// import 'package:ordo/data/model/get_results_response.dart';
//
// import '../model/exam_answer.dart';
// import '../model/exam_answer_responce.dart';
// import '../model/send_exam_answer.dart';
//
//
//
// class AllDataRepository {
//   static String _token = '';
//   static String? _userId;
//
//   //Login
//   // Future<Either<ServerError, GetAllProjects>> getAllProjects(
//   //     Map<String, dynamic>? query) async {
//   //   UserData userdata = await CashHelper.getUserData();
//   //   final response = await DioClient.getData(
//   //       url: "${BASE_URL}mobile/task/get-projects",
//   //       query: query,
//   //       token: userdata.token);
//   //   return response.fold(
//   //     (error) => Left(error),
//   //     (body) {
//   //       final GetAllProjects notificationResponce =
//   //       GetAllProjects.fromJson(body.data);
//   //       return Right(notificationResponce);
//   //     },
//   //   );
//   // }
//   Future<Either<ServerError, GetAllLevelsResponce>> GetAllLevels(
//       Map<String, dynamic>? query) async {
//     UserData userdata = await CashHelper.getUserData();
//     final response = await DioClient.getData(
//         url: "${BASE_URL}levels",
//         query: query,
//         token: userdata.accessToken);
//     return response.fold(
//           (error) => Left(error),
//           (body) {
//         final GetAllLevelsResponce getAllLevelsResponce =
//         GetAllLevelsResponce.fromJson(body.data);
//         return Right(getAllLevelsResponce);
//       },
//     );
//   }
//   ///getAllLevelsWithoutLogin
//   Future<Either<ServerError, GetAllLevelsResponce>> getAllLevelsWithoutLogin(
//       Map<String, dynamic>? query) async {
//     final response = await DioClient.getData(
//       url: "${BASE_URL}get-levels",
//       query: query,
//       // token: userdata.accessToken
//     );
//     return response.fold(
//           (error) => Left(error),
//           (body) {
//         final GetAllLevelsResponce getAllLevelsResponce =
//         GetAllLevelsResponce.fromJson(body.data);
//         return Right(getAllLevelsResponce);
//       },
//     );
//   }
//
//   ///AllSubject
//
//   Future<Either<ServerError, GetAllSubjectResponce>> GetAllSubject(
//       {Map<String, dynamic>? query
//         ,String? path
//       }
//       ) async {
//     UserData userdata = await CashHelper.getUserData();
//     final response = await DioClient.getData(
//         url: "${BASE_URL}subjects/${path}",
//         query: query,
//         token: userdata.accessToken);
//     return response.fold(
//           (error) => Left(error),
//           (body) {
//         final GetAllSubjectResponce getAllSubjectResponce =
//         GetAllSubjectResponce.fromJson(body.data);
//         return Right(getAllSubjectResponce);
//       },
//     );
//   }
//
//   ///AllSubject
//
//   Future<Either<ServerError, GetAllLessonsResponce>> GetAllLessons(
//       {Map<String, dynamic>? query
//         ,String? path
//       }
//       ) async {
//     UserData userdata = await CashHelper.getUserData();
//     final response = await DioClient.getData(
//         url: "${BASE_URL}lessons/${path}",
//         query: query,
//         token: userdata.accessToken);
//     return response.fold(
//           (error) => Left(error),
//           (body) {
//         final GetAllLessonsResponce getAllLessonsResponce =
//         GetAllLessonsResponce.fromJson(body.data);
//         return Right(getAllLessonsResponce);
//       },
//     );
//   }
//   /// GetLevelExam
//
//   Future<Either<ServerError, GetLevelExamResponce>> GetLevelExam(
//       {
//         Map<String, dynamic>? query
//       }
//       ) async {
//     UserData userdata = await CashHelper.getUserData();
//     print(query);
//     final response = await DioClient.getData(
//         url: "${BASE_URL}get-exam-by-level-id",
//         query: query,
//         token: userdata.accessToken);
//     return response.fold(
//           (error) => Left(error),
//           (body) {
//         final GetLevelExamResponce getAllLessonsResponce =
//         GetLevelExamResponce.fromJson(body.data);
//         return Right(getAllLessonsResponce);
//       },
//     );
//   }
//   /// SendExam
//
//   Future<Either<ServerError, ExamAnswerResponce>> SendExam(
//       {
//
//         required SendExamAnswer send,
//         required int level_id,
//       }) async {
//     UserData userdata = await CashHelper.getUserData();
//
//     send.levelId=level_id;
//     send.userId=userdata.id;
//
//     final response = await DioClient.postData2(
//         url: "${BASE_URL}do-exam",
//         data: send,
//         token: userdata.accessToken);
//     return response.fold(
//           (error) => Left(error),
//           (body) {
//         final ExamAnswerResponce getAllLessonsResponce =
//         ExamAnswerResponce.fromJson(body.data);
//         return Right(getAllLessonsResponce);
//       },
//     );
//   }  /// ReSendExam
//
//   Future<Either<ServerError, ExamAnswerResponce>> ReSendExam(
//       {
//
//         required SendExamAnswer send,
//         required int level_id,
//       }) async {
//     UserData userdata = await CashHelper.getUserData();
//
//     send.levelId=level_id;
//     send.userId=userdata.id;
//
//     final response = await DioClient.postData2(
//         url: "${BASE_URL}re-exam",
//         data: send,
//         token: userdata.accessToken);
//     return response.fold(
//           (error) => Left(error),
//           (body) {
//         final ExamAnswerResponce getAllLessonsResponce =
//         ExamAnswerResponce.fromJson(body.data);
//         return Right(getAllLessonsResponce);
//       },
//     );
//   }
//   ///GetAllNotBook
//
//   Future<Either<ServerError, GetAllNotesResponce>> GetAllNotBook(
//       ) async {
//     UserData userdata = await CashHelper.getUserData();
//     final response = await DioClient.getData(
//         url: "${BASE_URL}my_notebook",
//         token: userdata.accessToken);
//     return response.fold(
//           (error) => Left(error),
//           (body) {
//         final GetAllNotesResponce getAllLessonsResponce =
//         GetAllNotesResponce.fromJson(body.data);
//         return Right(getAllLessonsResponce);
//       },
//     );
//   }
//
//   ///GetResults
//
//   Future<Either<ServerError, ResultsResponseModel>> GetResults() async {
//     UserData userdata = await CashHelper.getUserData();
//     final response = await DioClient.getData(
//         url: "${BASE_URL}user-results", token: userdata.accessToken);
//     return response.fold(
//           (error) => Left(error),
//           (body) {
//         final ResultsResponseModel resultsResponseModel =
//         ResultsResponseModel.fromJson(body.data);
//         return Right(resultsResponseModel);
//       },
//     );
//   }
//
//   ///GetLessonsDetails
//
//   Future<Either<ServerError, GetLessonsDetailsResponce>> GetLessonsDetails(
//       {
//         String? path
//       }
//       ) async {
//     UserData userdata = await CashHelper.getUserData();
//     final response = await DioClient.getData(
//         url: "${BASE_URL}lesson_details/${path}",
//         token: userdata.accessToken);
//     return response.fold(
//           (error) => Left(error),
//           (body) {
//         final GetLessonsDetailsResponce getLessonsDetailsResponce =
//         GetLessonsDetailsResponce.fromJson(body.data);
//         return Right(getLessonsDetailsResponce);
//       },
//     );
//   }
//   ///getLessonsDetilsType3
//
//   Future<Either<ServerError, GetLessonstype3DetailsResponce>> getLessonsDetilsType3(
//       { required var data,
//
//       }
//       ) async {
//     UserData userdata = await CashHelper.getUserData();
//     final response = await DioClient.postFormData(
//         data: data,
//         url: "${BASE_URL}make-seen",
//         token: userdata.accessToken);
//
//     return response.fold(
//           (error) => Left(error),
//           (body) {
//         final GetLessonstype3DetailsResponce getLessonsDetailsResponce =
//         GetLessonstype3DetailsResponce.fromJson(body.data);
//         return Right(getLessonsDetailsResponce);
//       },
//     );
//   }
// //   Future<Either<ServerError, GetAllChatRoomResponce>> getAllChatRoom(
// //       Map<String, dynamic>? query) async {
// //     UserData userdata = await CashHelper.getUserData();
// //     final response = await DioClient.getData(
// //         url: "${BASE_URL}frontend/contact-us-for-mobile",
// //         query: query,
// //         token: userdata.token);
// //     return response.fold(
// //       (error) => Left(error),
// //       (body) {
// //         final GetAllChatRoomResponce getAllChatRoomResponce =
// //         GetAllChatRoomResponce.fromJson(body.data);
// //         return Right(getAllChatRoomResponce);
// //       },
// //     );
// //   }
// //   Future<Either<ServerError, GetAllAdds>> getAllAdds(
// //      ) async {
// //     final response = await DioClient.getData(
// //         url: "${BASE_URL}frontend/ads",
// //        );
// //     return response.fold(
// //       (error) => Left(error),
// //       (body) {
// //         final GetAllAdds getAllChatRoomResponce =
// //         GetAllAdds.fromJson(body.data);
// //         return Right(getAllChatRoomResponce);
// //       },
// //     );
// //   }
// //   ///getCategory////////////////////////////////////////////////////////
// //   Future<Either<ServerError, GetAllCategoryResponce>> getCategory(  Map<String, dynamic>? query
// //       ) async {
// //     final response = await DioClient.getData(
// //         url: "${BASE_URL}specialists",
// //         query: query
// //
// //     );
// //     return response.fold(
// //       (error) => Left(error),
// //       (body) {
// //         final GetAllCategoryResponce getAllcategoryResponce =
// //         GetAllCategoryResponce.fromJson(body.data);
// //         return Right(getAllcategoryResponce);
// //       },
// //     );
// //   }
// //   ///getAllShop////////////////////////////////////////////////////////
// //   Future<Either<ServerError, GetAllShopResponce>> getAllShop(
// //       Map<String, dynamic>? query  ) async {
// //     print(query);
// //     print("${BASE_URL}frontend/marketers-for-mobile");
// //     final response = await DioClient.getData(
// //         url: "${BASE_URL}frontend/marketers-for-mobile",
// //       query: query
// //        );
// //     return response.fold(
// //       (error) => Left(error),
// //       (body) {
// //         final GetAllShopResponce getAllShopResponce =
// //         GetAllShopResponce.fromJson(body.data);
// //         return Right(getAllShopResponce);
// //       },
// //     );
// //   }
// //   ///MyCobons///////////////////////////////////////////
// //
// //   Future<Either<ServerError, GetAllMyCobonResponce>> getMyCobon(
// //       Map<String, dynamic>? query  ) async {
// //     UserData userdata = await CashHelper.getUserData();
// //
// //   final response = await DioClient.getData(
// //         url: "${BASE_URL}frontend/my-coupons",
// //       query: query,
// //         token: userdata.token
// //        );
// //     return response.fold(
// //       (error) => Left(error),
// //       (body) {
// //         final GetAllMyCobonResponce getAllShopResponce =
// //         GetAllMyCobonResponce.fromJson(body.data);
// //         return Right(getAllShopResponce);
// //       },
// //     );
// //   }
// //   ///AllStoreCobons///////////////////////////////////////////
// //
// //   Future<Either<ServerError, GetAllStoreCobonResponce>> getStoreCobon(
// //       Map<String, dynamic>? query  ) async {
// //     // UserData userdata = await CashHelper.getUserData();
// // print(query);
// //   final response = await DioClient.getData(
// //         url: "${BASE_URL}frontend/latest-coupons",
// //       query: query,
// //         // token: userdata.token
// //        );
// //     return response.fold(
// //       (error) => Left(error),
// //       (body) {
// //         final GetAllStoreCobonResponce getAllShopResponce =
// //         GetAllStoreCobonResponce.fromJson(body.data);
// //         return Right(getAllShopResponce);
// //       },
// //     );
// //   }
// //   ///MyCobonDetails///////////////////////////////////////////
// //
// //   Future<Either<ServerError, GetCobonDetailsResponce>> getMyCobonDetails(
// //       {String? cobonid}) async {
// //     // UserData userdata = await CashHelper.getUserData();
// //
// //   final response = await DioClient.getData(
// //         url: "${BASE_URL}frontend/coupons/$cobonid",
// //       // query: query,
// //       //   token: userdata.token
// //        );
// //     return response.fold(
// //       (error) => Left(error),
// //       (body) {
// //         final GetCobonDetailsResponce getAllShopResponce =
// //         GetCobonDetailsResponce.fromJson(body.data);
// //         return Right(getAllShopResponce);
// //       },
// //     );
// //   }
// //   ///DeleteCobon///////////////////////////////////////////
// //
// //   Future<Either<ServerError, GetDeleteCobonResponce>> getDeleteCobon(
// //       {String? cobonid}) async {
// //     UserData userdata = await CashHelper.getUserData();
// //
// //   final response = await DioClient.deleteData(
// //         url: "${BASE_URL}frontend/coupons/$cobonid",
// //       // query: query,
// //         token: userdata.token
// //        );
// //     return response.fold(
// //       (error) => Left(error),
// //       (body) {
// //         final GetDeleteCobonResponce getDeleteCobonResponce =
// //         GetDeleteCobonResponce.fromJson(body.data);
// //         return Right(getDeleteCobonResponce);
// //       },
// //     );
// //   }
// // ///increaseCopy///////////
// // Future<Either<ServerError, increasecount>> increaseCopy(
// //     Map<String, dynamic> data) async {
// //   final response = await DioClient.postData(
// //     url:"${BASE_URL}frontend/increase-copy",
// //     data: data,
// //
// //   );
// //
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) {
// //       final increasecount getCobonDetailsResponce = increasecount.fromJson(body.data);
// //       return Right(getCobonDetailsResponce);
// //     },
// //   );
// // }
// //
// //
// // ///editcopon
// //   Future<Either<ServerError, GetCobonDetailsResponce>> editCobon({  required Map<String, dynamic> data,
// //     required Map<String, dynamic> query
// //     ,required String cobonId}
// //     ) async {
// //     UserData userdata=await CashHelper.getUserData();
// //
// //     final response = await DioClient.PostData(
// //       url: "${BASE_URL}frontend/coupons/${cobonId}",
// //       data: data,
// //       token: userdata.token,
// //       query: query
// //
// //     );
// //
// //     return response.fold(
// //           (error) => Left(error),
// //           (body) {
// //         final GetCobonDetailsResponce getCobonDetailsResponce = GetCobonDetailsResponce.fromJson(body.data);
// //         return Right(getCobonDetailsResponce);
// //       },
// //     );
// //   }
// // ///editcopon
// //   Future<Either<ServerError, AddCoponResponce>> addCobon({  required Map<String, dynamic> data,
// //    }
// //     ) async {
// //     UserData userdata=await CashHelper.getUserData();
// //
// //     final response = await DioClient.postData(
// //       url: "${BASE_URL}frontend/coupons",
// //       data: data,
// //       token: userdata.token,
// //
// //
// //     );
// //
// //     return response.fold(
// //           (error) => Left(error),
// //           (body) {
// //         final AddCoponResponce getCobonDetailsResponce = AddCoponResponce.fromJson(body.data);
// //         return Right(getCobonDetailsResponce);
// //       },
// //     );
// //   }
// //
// //   ///SendMessage///////////////////////////////////////////
// //
// //   Future<Either<ServerError, SendChatMessageResponce>> SendMessage(
// //       {String? chatId,  required Map<String, dynamic> data}) async {
// //     UserData userdata = await CashHelper.getUserData();
// //     final response = await DioClient.postData(
// //       url: "${BASE_URL}frontend/contact-us/$chatId",
// //        data: data,
// //         token: userdata.token
// //     );
// //     return response.fold(
// //           (error) => Left(error),
// //           (body) {
// //         final SendChatMessageResponce sendMessageResponce =
// //         SendChatMessageResponce.fromJson(body.data);
// //         return Right(sendMessageResponce);
// //       },
// //     );
// //   }
// //   ///UnreadMessage///////////////////////////////////////////
// //
// //   Future<Either<ServerError, UnReadMessageResponce>> UnreadMessage(
// //       ) async {
// //     UserData userdata = await CashHelper.getUserData();
// //     final response = await DioClient.postData(
// //       url: "${BASE_URL}frontend/unread-messages",
// //         token: userdata.token
// //     );
// //     return response.fold(
// //           (error) => Left(error),
// //           (body) {
// //         final UnReadMessageResponce sendMessageResponce =
// //         UnReadMessageResponce.fromJson(body.data);
// //         return Right(sendMessageResponce);
// //       },
// //     );
// //   }
// //   ///getChatMessage///////////////////////////////////////////
// //
// //   Future<Either<ServerError, AllChatMessageResponce>> getChatMessage(
// //       {String? chatId,  required Map<String, dynamic> query}) async {
// //     UserData userdata = await CashHelper.getUserData();
// //     final response = await DioClient.getData(
// //       url: "${BASE_URL}frontend/contact-us-for-mobile/$chatId",
// //        query: query,
// //         token: userdata.token
// //     );
// //     return response.fold(
// //           (error) => Left(error),
// //           (body) {
// //         final AllChatMessageResponce allChatMessageResponce =
// //         AllChatMessageResponce.fromJson(body.data);
// //         return Right(allChatMessageResponce);
// //       },
// //     );
// //   }
// //   ///getAllCountries///////////////////////////////////////////
// //
// //   Future<Either<ServerError, GetAllCountries>> getAllCountries(
// //       ) async {
// //     final response = await DioClient.getData(
// //       url: "${BASE_URL}countries",
// //
// //     );
// //     return response.fold(
// //           (error) => Left(error),
// //           (body) {
// //         final GetAllCountries getAllCountries =
// //         GetAllCountries.fromJson(body.data);
// //         return Right(getAllCountries);
// //       },
// //     );
// //   }
// //
//
// //edit profile
// // Future<Either<ServerError, UserData>> updateUserData(
// //     Map<String, dynamic> editProfile) async {
// //   final response = await DioClient.putData(
// //     url: "$USERDATA${CashHelper.getData(key: 'id')}",
// //     data: editProfile,
// //     token: CashHelper.getData(key: 'token'),
// //   );
// //
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) {
// //       return Right(UserData.fromMap(body.data));
// //     },
// //   );
// // }
//
// //edit post
// //   Future<Either<ServerError, EditPost>> updatePostData(
// //       Map<String, dynamic> editPost, String id) async {
// //     final response = await DioClient.putData(
// //       url: "$PRODUCT/$id",
// //       data: editPost,
// //       token: CashHelper.getData(key: 'token'),
// //     );
// //
// //     return response.fold(
// //       (error) => Left(error),
// //       (body) {
// //         return Right(EditPost.fromMap(body.data));
// //       },
// //     );
// //   }
//
// //mail reset password
// // Future<Either<ServerError, UserMail>> reset(
// //     Map<String, dynamic> resetPass) async {
// //   final response = await DioClient.postData(
// //     url: RESET,
// //     data: resetPass,
// //     token: CashHelper.getData(key: 'token'),
// //   );
// //
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) {
// //       final UserMail userMail = UserMail.fromJson(body.data);
// //       return Right(userMail);
// //     },
// //   );
// // }
//
// // verify code
// //   Future<Either<ServerError, ResetCodes>> verify(
// //       Map<String, dynamic> verifyCode) async {
// //     final response = await DioClient.postData(
// //       url: VERIFY,
// //       data: verifyCode,
// //       token: CashHelper.getData(key: 'token'),
// //     );
// //
// //     return response.fold(
// //       (error) => Left(error),
// //       (body) {
// //         final ResetCodes resetCode = ResetCodes.fromJson(body.data);
// //         return Right(resetCode);
// //       },
// //     );
// //   }
//
// // for new password
// //   Future<Either<ServerError, NewPass>> newPass(
// //       Map<String, dynamic> newPass) async {
// //     final response = await DioClient.postData(
// //       url: NEWPASS,
// //       data: newPass,
// //       token: CashHelper.getData(key: 'token'),
// //     );
// //
// //     return response.fold(
// //       (error) => Left(error),
// //       (body) {
// //         return Right(NewPass.fromMap(body.data));
// //       },
// //     );
// //   }
//
// // for change password
// // Future<Either<ServerError, NewPass>> changePass(
// //     Map<String, dynamic> newPass) async {
// //   final response = await DioClient.postData(
// //     url: CHANGEPASS,
// //     data: newPass,
// //     token: CashHelper.getData(key: 'token'),
// //   );
// //
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) {
// //       return Right(NewPass.fromMap(body.data));
// //     },
// //   );
// // }
//
// //Update User Image
// // Future<Either<ServerError, UserData>> updateUserImage(FormData data) async {
// //   final response = await DioClient.putFormData(
// //     url: "$USERDATA${CashHelper.getData(key: 'id')}",
// //     data: data,
// //     token: CashHelper.getData(key: 'token'),
// //   );
// //
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) {
// //       return Right(UserData.fromMap(body.data));
// //     },
// //   );
// // }
//
// //post product
// // Future<Either<ServerError, Product>> postProduct(FormData data) async {
// //   final response = await DioClient.postFormData(
// //     url: "$PRODUCT",
// //     data: data,
// //     token: CashHelper.getData(key: 'token'),
// //   );
// //
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) {
// //       return Right(Product.fromMap(body.data));
// //     },
// //   );
// // }
//
// //User data
// // Future<Either<ServerError, UserData>> userDataFun() async {
// //   final response = await DioClient.getData(
// //     url: "$USERDATA${CashHelper.getData(key: 'id')}",
// //     token: CashHelper.getData(key: 'token'),
// //   );
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) => Right(UserData.fromMap(body.data)),
// //   );
// // }
//
// //SignUP
// // Future<Either<ServerError, AuthResponse>> signUp(
// //     Map<String, dynamic> signUpRequest) async {
// //   final response = await DioClient.postData(
// //     url: SIGN,
// //     data: signUpRequest,
// //   );
// //
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) => Right(AuthResponse.fromMap(body.data)),
// //   );
// // }
//
// //for favourite get
// // Future<Either<ServerError, Favourite>> favItemsFun() async {
// //   final response = await DioClient.getData(
// //     url: FAV,
// //     token: CashHelper.getData(key: 'token'),
// //   );
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) => Right(Favourite.fromMap(body.data)),
// //   );
// // }
//
// // Future<Either<ServerError, Orders>> orderedAdsFun() async {
// //   final response = await DioClient.getData(
// //     url: ORDEREDADS,
// //     token: CashHelper.getData(key: 'token'),
// //   );
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) => Right(Orders.fromList(body.data)),
// //   );
// // }
//
// //for favourite post
// // Future<Either<ServerError, Favourite>> addFav(
// //   String id) async {
// //   final response = await DioClient.postData(
// //     url: "$FAV/$id",
// //     token: CashHelper.getData(key: 'token'),
// //   );
// //
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) => Right(Favourite.fromMap(body.data)),
// //   );
// // }
//
// // Future<Either<ServerError, Products>> homeDataFun() async {
// //   final response = await DioClient.getData(
// //     url: PRODUCT,
// //     token: CashHelper.getData(key: 'token'),
// //   );
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) => Right(Products.fromList(body.data)),
// //   );
// // }
//
// // Future<Either<ServerError, ProductDetails>> detailsFun(
// //   String id,
// // ) async {
// //   final response = await DioClient.getData(
// //     url: '$PRODUCT/$id',
// //     token: CashHelper.getData(key: 'token'),
// //   );
// //   return response.fold(
// //     (error) => Left(error),
// //     (body) => Right(ProductDetails.fromMap(body.data)),
// //   );
// // }
// }
