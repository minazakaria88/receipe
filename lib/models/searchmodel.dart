class SearchModel
{
  String ? name;
  String? instruction;
  String ? video;
  String ?image;
  String ?origin;
  String ? category;

  SearchModel.fromJson(Map<String , dynamic> json)
  {
    name=json['strMeal'];
    instruction=json['strInstructions'];
    image=json['strMealThumb'];
    video=json['strYoutube'];
    origin=json['strArea'];
    category=json['strCategory'];
  }
}