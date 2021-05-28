class CategoryModel{
  String name,imageUrl;

  CategoryModel({this.name, this.imageUrl});
  CategoryModel.fromJson(Map<dynamic,dynamic> map){
    if(map==null) return;
    name=map['name'];
    imageUrl=map['imageUrl'];
  }
  toJson(){
    return {
      'name':name,
      'imageUrl':imageUrl
    };
  }
}