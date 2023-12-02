import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/model/search_responses/SearchResponses.dart';
import 'package:movie_app/domain/di/di.dart';
import 'package:movie_app/ui/screens/film_details/film_details.dart';
import 'package:movie_app/ui/screens/main/tabs/search/search_view_model.dart';
import 'package:movie_app/ui/utils/app_assets.dart';
import 'package:movie_app/ui/utils/app_colors.dart';
import 'package:movie_app/ui/utils/base_request_states.dart';
import 'package:movie_app/ui/utils/constants.dart';
import 'package:movie_app/ui/utils/error_view.dart';
import 'package:movie_app/ui/widgets/card_of_movies_search.dart';
import 'package:movie_app/ui/widgets/loading_widget.dart';

class SearchScreen extends StatefulWidget {


   SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchViewModel viewModel = getIt();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height *.03,
          ),
          TextFormField(
            controller: viewModel.controller,
            onChanged: (text){
             viewModel.changeOfController = text ;
             print("text is : $text");
            },
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: AppColors.grey,width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: AppColors.grey,width: 2)
              ),
              prefixIcon:const Icon(Icons.search_rounded,color:Colors.white70,),
              filled: true,
              fillColor:AppColors.blackGrey,
              hintText: "Search",
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.grey),
              border: InputBorder.none,
            ),
            cursorColor: AppColors.grey,
            cursorHeight: 20,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white70 , fontSize: 18),
          ),
          BlocBuilder(
            bloc: viewModel.useCase,
              builder: (context, state) {
                if(state is BaseRequestSuccessState){
                  return buildListView(state.data);
                }else if(state is BaseRequestErrorState){
                  return Expanded(
                    child: Center(
                      child: Text(
                       Constants.defaultErrorMessage,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.accent,
                        ),
                      ),
                    ),
                  );
                }else{
                  return  Expanded(
                    child: Center(
                      child: Text(
                        "write anything to search...",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.accent,
                        ),
                      ),
                    ),
                  );
                }
              },
          ),
        ],
      ),
    );
  }

  Widget buildListView(List<SearchResult>? move) => Expanded(
    child: ListView.separated(
        itemBuilder: (context, index) =>SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CardMoviesSearch(move[index]),
          ),
        ),
        separatorBuilder: (context, index) => Container(height: 1,width:MediaQuery.of(context).size.width * .8, color: AppColors.grey,),
        itemCount: move!.length
    ),
  );
}
