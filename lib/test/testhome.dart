import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/reusable.dart';
import 'package:recipe/test/testcubit.dart';
import 'package:recipe/test/teststate.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit = TestCubit.get(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<TestCubit,TestSate>(
          builder: (context, state)
          {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                          backgroundColor: cubit.pizza? defaultColor1:defaultColor2,
                          child: const Text('pizza'),
                          onPressed: ()
                          {
                            cubit.changeColor(1);
                          }
                      ),
                      FloatingActionButton(
                          backgroundColor: cubit.meat? defaultColor1:defaultColor2,
                          child: const Text('meat'),
                          onPressed: ()
                          {
                            cubit.changeColor(2);
                          }
                      ),
                      FloatingActionButton(
                          backgroundColor: cubit.rice? defaultColor1:defaultColor2,
                          child: const Text('rice'),
                          onPressed: ()
                          {
                            cubit.changeColor(3);
                          }
                      ),
                    ],
                  ),
                ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                      maxLines: 1000,
                      cursorColor: defaultColor2,

                      style: TextStyle(
                        color: defaultColor2
                      ),
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defaultColor2,
                            width: 10,
                          )
                        )
                      ),
                  ),
                   ),
                 ),
              ],
            );
          },
        ),
      ),
    );
  }
}
