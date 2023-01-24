import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Features/Login/presentation/manger/login_cubit/login_cubit.dart';
import 'Features/Login/presentation/manger/login_cubit/login_state.dart';
import 'Features/Login/presentation/views/login_view.dart';
import 'Features/Splash/presentation/views/splash_view.dart';
import 'Features/home/presentation/manger/app_cycle_cubit/app_cubit.dart';
import 'Features/home/presentation/manger/app_cycle_cubit/app_state.dart';
import 'Features/home/presentation/views/home_view.dart';
import 'core/utils/bloc_observed.dart';
import 'core/utils/constants.dart';
import 'core/utils/function/show_toast.dart';
import 'core/utils/language/app_local.dart';
import 'core/utils/network/local/cache_helper.dart';
import 'core/utils/styles/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // // If you're going to use other Firebase services in the background, such as Firestore,
  // // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  showToast(msg: 'on background message ', state: ToastStates.success);
  print("Handling a background message: ${message.data.toString()}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  var token = await FirebaseMessaging.instance.getToken();
  print('tttttttttttttttttttttttttttt ${token.toString()}');
  FirebaseMessaging.onMessage.listen((event) {
    print('on messsssssssssssssageeeeeeee${event.data.toString()}');
    showToast(msg: 'on message ', state: ToastStates.success);
  }).onError((error) {
    print('erroor messsssssssssssssageeeeeeee${error.toString()}');
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    showToast(msg: 'on foreground message ', state: ToastStates.success);

    print('on messsssssssssssssageeeeeeee${event.data.toString()}');
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Widget widget;
  kUID = CacheHelper.getData(key: 'uId');
  if (kUID != null) {
    widget = const HomeView();
  } else {
    widget = const LoginView();
  }
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final dynamic startWidget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..getUserData()
              ..getPosts(),
          ),
          BlocProvider(
            create: (BuildContext context) => LoginCubit(),
          )
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return MaterialApp(
              title: 'Shop App',
              theme: getApplicationTheme(),
              localizationsDelegates: const [
                AppLocale.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale("ar", ""),
                Locale("en", ""),
              ],
              locale: AppCubit.get(context).isEnglish
                  ? const Locale("en", "")
                  : const Locale("ar", ""),
              // localeResolutionCallback: (currentLang, supportLang) {
              //   if (currentLang != null) {
              //     for (Locale locale in supportLang) {
              //       if (locale.languageCode == currentLang.languageCode) {
              //         //mySharedPreferences.setString("lang",currentLang.languageCode) ;
              //         return currentLang;
              //       }
              //     }
              //
              //     return supportLang.first;
              //   }
              // },
              debugShowCheckedModeBanner: false,
              home: SplashView(widget: startWidget),
            );
          },
        ));
  }
}
