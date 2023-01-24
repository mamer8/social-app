import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<dynamic> saveData({required String key, required value}) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    if (value is double) return await sharedPreferences!.setDouble(key, value);
    if (value is List<String>) {
      return await sharedPreferences!.setStringList(key, value);
    }
  }

  static Future<dynamic> removeData({required String key}) {
    return sharedPreferences!.remove(key);
  }
}

//
// class CashHelper {
//   static SharedPreferences? sharedPreferences;
//
//   init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   static void saveData({
//     required String key,
//     required dynamic value,
//   }) async {
//     sharedPreferences = await SharedPreferences.getInstance();
//
//     if (value is String) return await sharedPreferences!.setString(key, value);
//     if (value is int) return await sharedPreferences!.setInt(key, value);
//     if (value is bool) return await sharedPreferences!.setBool(key, value);
//     if (value is double) return await sharedPreferences!.setDouble(key, value);
//
//     sharedPreferences!.setString(key, value);
//   }
//
//   static void saveUserData({
//     required UserData userData,
//   }) async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     Map<String, dynamic> productsMap = userData.toMap();
//
//     print(productsMap);
//     sharedPreferences!.setString(USER_DATA, json.encode(productsMap));
//   }
//
//   static dynamic getData({
//     required String key,
//   }) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     // if (sharedPreferences != null) {
//     //   print("sssssssssssssssssss");
//     return await prefs.getString(key);
//     // } else {
//     //   print("eeeeeeeeeeeeeeeeeeee");
//     //   return null;
//     // }
//   }
//
//   static dynamic getUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.getString(USER_DATA) != null) {
//       Map<String, dynamic>? jsondatais =
//           jsonDecode(prefs.getString(USER_DATA)!);
//       var user = UserData.fromJson(jsondatais!);
//       if (jsondatais.isNotEmpty) {
//         return await user;
//       }
//     } else {
//       return null;
//     }
//   }
//
//   static Future<UserData?> getUserData2() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.getString(USER_DATA) != null) {
//       Map<String, dynamic>? jsondatais =
//           jsonDecode(prefs.getString(USER_DATA)!);
//       var user = UserData.fromJson(jsondatais!);
//       if (jsondatais.isNotEmpty) {
//         return await user;
//       }
//     } else {
//       return null;
//     }
//   }
//
//   static Future<bool> removeData({required String key}) async {
//     sharedPreferences = await SharedPreferences.getInstance();
//
//     return await sharedPreferences!.remove(key);
//   }
//
//   static Future<bool> removeAllData() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//
//     return await sharedPreferences!.clear();
//   }
//
//   static dynamic getInformation() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.getString(USER_DATA) != null) {
//       Map<String, dynamic>? jsondatais =
//           jsonDecode(prefs.getString(USER_DATA)!);
//       var InformationData = UserData.fromJson(jsondatais!);
//       if (jsondatais.isNotEmpty) {
//         return await InformationData;
//       }
//     } else {
//       return null;
//     }
//   }
//
//   static dynamic getMyNoteBook() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.getString(USER_DATA) != null) {
//       Map<String, dynamic>? jsondatais =
//           jsonDecode(prefs.getString(USER_DATA)!);
//       var NoteBookData = UserData.fromJson(jsondatais!);
//       if (jsondatais.isNotEmpty) {
//         return await NoteBookData;
//       }
//     } else {
//       return null;
//     }
//   }
//
//   static dynamic getMyResults() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (prefs.getString(USER_DATA) != null) {
//       Map<String, dynamic>? jsondatais =
//           jsonDecode(prefs.getString(USER_DATA)!);
//       var ResultData = UserData.fromJson(jsondatais!);
//       if (jsondatais.isNotEmpty) {
//         return await ResultData;
//       }
//     } else {
//       return null;
//     }
//   }
// }
