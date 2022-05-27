class Food {
  String? foodID;
  String? restaurantId;
  String? catID;
  String? foodName;
  String? foodPicUrl;
  String? foodPrice;
  String? foodDescription;
  String? foodRating;
  String? numberOfRatings;

  Food(
      {this.foodID,
      this.restaurantId,
      this.catID,
      this.foodName,
      this.foodPicUrl,
      this.foodPrice,
      this.foodDescription,
      this.foodRating,
      this.numberOfRatings});

  Map<String, dynamic> toJson(String method,
      {String? catID, String? foodID, String? keyWord}) {
    switch (method) {
      case 'foods':
        return {'method': 'foods', 'cat_id': catID};
      case 'food':
        return {'method': 'food', 'food_id': foodID};
      case 'search_food':
        return {'method': 'search_food', 'keyword': keyWord};
      default:
        return {};
    }
  }

  Food.fromJson(Map<String, dynamic> map)
      : foodID = map['id'],
        restaurantId = map['resturant_id'],
        catID = map['cat_id'],
        foodName = map['name'],
        foodPicUrl = map['pic'],
        foodPrice = map['price'],
        foodDescription = map['description'],
        foodRating = map['rating'],
        numberOfRatings = map['number_of_ratings'];
}
