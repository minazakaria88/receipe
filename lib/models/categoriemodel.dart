class CategoryModel {
  List<CategoryDetailsModel> categories=[];
  CategoryModel.fromJson(Map<String,dynamic> json)
  {
    json['categories'].forEach((e){
      categories.add(CategoryDetailsModel.fromJson(e));
    });
  }
}

class CategoryDetailsModel
{
  String ? name;
  String ? image;

  CategoryDetailsModel.fromJson(Map<String,dynamic> json)
  {
    name=json['strCategory'];
    image=json['strCategoryThumb'];
  }

}
