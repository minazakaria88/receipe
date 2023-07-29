class DetailsModel
{
  String ?name;
  String? image;

  DetailsModel.fromJson(Map<String,dynamic>json)
  {
    name=json['strMeal'];
    image=json['strMealThumb'];
  }
}
class Meals
{
  List<DetailsModel> meals=[];
  Meals.fromJson(Map<String,dynamic>json)
  {
    json['meals'].forEach((e){
      meals.add(DetailsModel.fromJson(e));
    });
  }

}