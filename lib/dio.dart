import 'package:dio/dio.dart';

class DioHelper
{
    static Dio ? dio;
    static void init()
    {
        dio=Dio(
            BaseOptions(
                baseUrl: 'https://www.themealdb.com/',
                receiveDataWhenStatusError: true,
            ),
        );
    }
    static Future<Response> getData({
        String ? url,
        Map<String ,dynamic> ?query,
})
    {
       return dio!.get(
            url!,
            queryParameters: query,
        );
    }
}
//https://www.themealdb.com/api/json/v1/1/categories.php