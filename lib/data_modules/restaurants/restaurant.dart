class Restaurant {
  String? id;
  String? restName;
  String? picUrl;
  String? delivery;
  String? deliveryTime;
  String? tags;
  String? rating;
  String? coverPhotoUrl;
  String? verified;
  String? numberOfRatings;
  String? address;
  String? lat;
  String? lng;

  Restaurant(
      {this.id,
      this.restName,
      this.picUrl,
      this.delivery,
      this.deliveryTime,
      this.tags,
      this.rating,
      this.coverPhotoUrl,
      this.verified,
      this.numberOfRatings,
      this.address,
      this.lat,
      this.lng});

  /// Call this function at the HomePage when you search restaurants (searchKeyword not null)
  /// response will be a list of objects of type restaurant
  /// Call this function when clicking at a restaurant from the HomePage (restaurantID not null)
  /// response will be a list of objects of type restaurant
  /// and another list of type food (called items)
  Map<String, dynamic> toJson(String method,
      {String? searchKeyWord, String? restaurantID}) {
    if (searchKeyWord == null) {
      return {'method': method, 'restaurant_id': restaurantID};
    } else if (restaurantID == null) {
      return {'method': method, 'keyword': searchKeyWord};
    } else {
      return {};
    }
  }

  /// you use this line of code with this function
  /// .map((e) => Restaurant.fromJson(e)).toList()
  /// of course this will return a list of restaurant objects
  /// so you save them in a list of type List<Restaurant>
  Restaurant.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        restName = map['name'],
        picUrl = map['pic'],
        delivery = map['delivery'],
        deliveryTime = map['deliveryTime'],
        tags = map['tags'],
        rating = map['rating'],
        coverPhotoUrl = map['coverPhoto'],
        verified = map['verified'],
        numberOfRatings = map['numberOfRatings'],
        address = map['address'],
        lat = map['lat'],
        lng = map['lng'];
}
