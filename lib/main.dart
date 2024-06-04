import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled/data_layer/firebase/firebaseAuth.dart';
// import 'package:untitled/presentation_layer/ui/authNyPhone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/presentation_layer/ui/homeScreen/homeScreen.dart';
import 'package:untitled/presentation_layer/ui/loginScreen.dart';
// import 'package:untitled/presentation_layer/ui/login_Page.dart';
import 'package:untitled/presentation_layer/ui/registerScreen.dart';
import 'package:untitled/presentation_layer/ui/tabs/browseTab/movieGenreList/movie_genre_list_view.dart';
import 'DI/dI.dart';
import 'firebase_options.dart';

void main() async{
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(Provider(
      create: (BuildContext context) =>FirebaseAuthUser(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        routes: {
          LoginScreen.routeName :(context)=> LoginScreen(),
          RegisterScreen.routeName :(context)=>RegisterScreen(),
          HomeScreen.routeName:(context)=>HomeScreen(),
          MovieGenreListView.routeName:(context)=>MovieGenreListView(),
        },
        initialRoute:LoginScreen.routeName,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: false,
        ),
      ),
    );
  }
}


