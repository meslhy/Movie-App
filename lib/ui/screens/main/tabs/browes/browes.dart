import 'package:flutter/cupertino.dart';
import 'package:movie_app/ui/utils/app_colors.dart';


class BrowesScreen extends StatelessWidget {
  const BrowesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(child: Text("BrowesScreen....." , style: TextStyle(color: AppColors.white , fontSize: 30),)),
      ],
    );
  }
}
