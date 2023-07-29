import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/ingridients.dart';
import 'package:recipe/reusable.dart';

import 'appcubit/cubit.dart';
import 'appcubit/state.dart';

class CategoriesClick extends StatelessWidget {
  const CategoriesClick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = AppCubit.get(context).meals;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Meals'),
          ),
          body:
          model!=null?
          ListView.builder(
              itemBuilder: (context, index) => itemClick(
                context: context,
                model: model.meals[index],
                function: ()
                  {
                    AppCubit.get(context).search(model.meals[index].name!, 2).then((value) {
                      goTo(
                        context: context,
                        screen: const Ingredients(),
                      );
                    });
                  }
              ),
            itemCount: model.meals.length,
          ):progress(),
        );
      },
    );
  }
}
