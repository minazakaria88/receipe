import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/appcubit/cubit.dart';
import 'package:recipe/appcubit/state.dart';
import 'package:recipe/reusable.dart';
import 'package:recipe/search.dart';
import 'gatogriesclick.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = AppCubit.get(context).model;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Categories'),
            actions: [
              IconButton(
                  icon: const Icon(Icons.search_rounded,
                  size: 25,
                    color: Colors.white,
                  ),
                onPressed: (){
                    goTo(
                      context: context,
                      screen: const SearchScreen(),
                    );

                },
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          body: model != null
              ? ListView.builder(
                  itemBuilder: (context, index) => item(
                    model: model.categories[index],
                    context: context,
                    function: () {
                      AppCubit.get(context).getCategoriesDetails(model.categories[index].name!).then((value) {
                        goTo(
                          context: context,
                          screen: const CategoriesClick()
                        );
                      });

                    },
                  ),
                  itemCount: model.categories.length,
                )
              : progress(),
        );
      },
    );
  }
}
