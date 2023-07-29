import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/appcubit/cubit.dart';
import 'package:recipe/appcubit/state.dart';
import 'package:recipe/reusable.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
     listener: (context, state) {

     },
     builder: (context, state) {
       var model=AppCubit.get(context).ingredientModel;
       return Scaffold(
         appBar: AppBar(
           title: Text('${model!.name}'),
         ),
         body: SingleChildScrollView(
           child: Column(
             children: [
                 searchItem(model, context),
             ],
           ),
         ),
       );
     },
    );
  }
}
