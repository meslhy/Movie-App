import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/di/di.dart';
import 'package:movie_app/ui/screens/main/main_view_model.dart';
import 'package:movie_app/ui/screens/main/tabs/browes/browse_screen.dart';
import 'package:movie_app/ui/screens/main/tabs/home/home_screen.dart';
import 'package:movie_app/ui/screens/main/tabs/search/search_screen.dart';
import 'package:movie_app/ui/utils/app_colors.dart';


class mainScreen extends StatefulWidget {
  static const roteName = "homeScreen";

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  MainViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{
        if(viewModel.currentIndex != 0 ) {
          viewModel.currentIndex = 0;
          setState(() {});
          return Future.value(false);
        }else {
          return Future.value(true);
        }

      },
      child: SafeArea(
        child: BlocBuilder(
          bloc: viewModel,
          builder:(context, state) =>  Scaffold(
            body: viewModel.tabs[viewModel.currentIndex],
            bottomNavigationBar: bottomNavBar(context),
          ),
        ),
      ),
    );
  }

  bottomNavBar(BuildContext context) => Theme(
    data: Theme.of(context).copyWith(
      canvasColor: AppColors.bottomNavBar,
    ),
    child: BottomNavigationBar(
      onTap: (index) {
        print("index is : $index");
        viewModel.changeTabIndex = index;
        print("current is : ${viewModel.currentIndex}");
      },
      currentIndex: viewModel.currentIndex,
      unselectedItemColor: AppColors.grey,
      selectedItemColor: AppColors.accent,

      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home ) , label: "Home"),
        const BottomNavigationBarItem(icon: Icon(Icons.search_rounded) , label: "Search"),
        const BottomNavigationBarItem(icon: Icon(Icons.local_movies)  , label: "Browse"),
        const BottomNavigationBarItem(icon: Icon(Icons.book)  , label: "WatchList"),
      ],
    ),
  );
}
