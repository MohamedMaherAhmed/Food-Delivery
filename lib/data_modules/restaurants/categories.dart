class Categories {
  String? id;
  String? catName;
  String? catPic;

  Categories({this.id, this.catName, this.catPic});

  /// for this one just send 'home' as value for this param
  /// and call it in the HomePage
  Map<String, dynamic> toJson(String method) {
    return {'method': method};
  }

  Categories.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        catName = map['cat_name'],
        catPic = map['cat_pic'];
}
