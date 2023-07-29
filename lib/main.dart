import 'package:bloc/bloc.dart';
import 'package:firebase_app/cubit/app_cubit/cubit.dart';
import 'package:firebase_app/layout/layout_screen.dart';
import 'package:firebase_app/modules/login_screen.dart';
import 'package:firebase_app/network/local/shared_preference.dart';
import 'package:firebase_app/sharing/bloc_observer.dart';
import 'package:firebase_app/style/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  var uId = CacheHelper.getData(key: 'uId') ;
  print(uId);
  Widget startWidget ;
  if(uId !=null){
    startWidget = LayoutScreen();
  }else{
    startWidget =LoginScreen();
  }
  runApp( MyApp(
    startWidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget ;
  const MyApp({
    this.startWidget
});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getHomeData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        home: startWidget,
      ),
    );
  }
}


