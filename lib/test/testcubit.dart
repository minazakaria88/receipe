


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/test/teststate.dart';

class TestCubit extends Cubit<TestSate>
{

  TestCubit():super(InitState());

  static TestCubit get(context)=>BlocProvider.of(context);

  bool pizza=false;
  bool meat=false;
  bool rice=false;

  void changeColor(int number)
  {
    if(number==1)
      {
        pizza=!pizza;
         meat=false;
         rice=false;
      }
    else if(number==2)
      {
        pizza=false;
        meat=!meat;
        rice=false;
      }
    else
      {
        pizza=false;
        meat=false;
        rice=!rice;
      }
    emit(ChangeValue());
  }



}