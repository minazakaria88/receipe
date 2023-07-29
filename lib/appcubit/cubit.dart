

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/appcubit/state.dart';
import 'package:recipe/dio.dart';
import 'package:recipe/models/categoriemodel.dart';
import 'package:recipe/models/categoryitems.dart';
import 'package:recipe/models/searchmodel.dart';

class AppCubit extends Cubit<AppState>
{
  AppCubit():super(InitAppState());

  static AppCubit get(context)=>BlocProvider.of(context);


  CategoryModel ? model;
  void getCategories()
  {
    DioHelper.getData(
      url: 'api/json/v1/1/categories.php',
    ).then((value) {
     model=CategoryModel.fromJson(value.data);
     emit(GetCategoriesSuccess());
    }).catchError((error){
      emit(GetCategoriesError());
    });


  }



  Meals ? meals;
  Future getCategoriesDetails(String category)
  {
    return DioHelper.getData(
      url: 'api/json/v1/1/filter.php',
      query: {
         'c':category,
      }
    ).then((value) {
      meals=Meals.fromJson(value.data);
      emit(GetCategoriesSuccess());
    }).catchError((error){

      emit(GetCategoriesError());
    });


  }

  TextEditingController controller=TextEditingController();
  SearchModel ? searchModel;
  SearchModel ? ingredientModel;
  Future search(String name,int id)
  {
     return DioHelper.getData(
      url: 'api/json/v1/1/search.php',
      query: {
        's':name,
      }
    ).then((value) {
        if(id==1)
          {
            searchModel=SearchModel.fromJson(value.data['meals'][0]);
            controller.clear();
          }
        else
          {
            ingredientModel=SearchModel.fromJson(value.data['meals'][0]);
          }
        emit(SearchSuccess());
    }).catchError((error){

      emit(SearchError());
    });

  }






}