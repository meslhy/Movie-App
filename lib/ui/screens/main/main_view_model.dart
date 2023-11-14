import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/ui/screens/main/tabs/browes/browes.dart';
import 'package:movie_app/ui/screens/main/tabs/home/home_screen.dart';
import 'package:movie_app/ui/screens/main/tabs/search/search_screen.dart';


@injectable
class MainViewModel extends Cubit{
  int currentIndex = 0 ;

  List<Widget> tabs = [
    HomeScreen(),
    SearchScreen(),
    BrowesScreen(),
    SearchScreen(),
  ];

  MainViewModel() : super(MainInitialState());

   set changeTabIndex(int index){

    currentIndex = index;
    emit(MainInitialState());
    print("done");
  }


}

class MainInitialState{}