import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/data/model/details_responses/DetailsResponses.dart';
import 'package:movie_app/ui/screens/main/main_screen.dart';
import 'package:movie_app/ui/screens/splash/splash_screen.dart';
import 'package:movie_app/ui/utils/app_theme.dart';
import 'domain/di/di.dart';
import 'ui/screens/main/tabs/watched/watched_view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 4));
  await Hive.initFlutter();
  Hive.registerAdapter(DetailsResponsesAdapter());
  await Hive.openBox<DetailsResponses>("moviesBox");
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => WatchlistCubit()..populateList() ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        routes: {
          mainScreen.roteName : (context) => mainScreen(),
          SplashScreen.roteName : (context) => SplashScreen(),
        },
        initialRoute: SplashScreen.roteName,
      ),
    );
  }
}

