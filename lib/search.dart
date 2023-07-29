import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/appcubit/cubit.dart';
import 'package:recipe/appcubit/state.dart';
import 'package:recipe/reusable.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit=AppCubit.get(context);
        var model=cubit.searchModel;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height:20 ,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextFormField(
                            style:  TextStyle(
                              color: defaultColor2,
                              fontSize: 16,
                            ),
                            controller: cubit.controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'meal name',
                              hintStyle: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 55,
                          child: MaterialButton(
                            color: defaultColor2,
                              onPressed: (){
                                    cubit.search(cubit.controller.text,1);
                              },
                            child: const Text(
                                'search',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                              ),

                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               model==null? Container(): searchItem(model, context),

              ],
            ),
          ),
        );
      },
    );
  }
}
