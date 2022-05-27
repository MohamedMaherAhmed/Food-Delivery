class User {
  String type;
  String? email;
  String pass;
  String? name;
  String? mobile;
  String? pic;

  /// Default Constructor for the Register Operation
  User(
      {this.type = "user",
      this.email,
      this.pass = '1',
      this.name,
      this.mobile,
      this.pic});

  /// toJson data form conversion method
  /// which converts the data into Json formed view
  /// and include that in the request to the back end
  /// and it's fine for some of the variables to be null
  /// when sending or receiving request/response
  /// call this function in the Login UI
  Map<String, dynamic> loginToJson(
          {required String method,
          required String loginEmail,
          String loginType = "user",
          String loginPass = '1'}) =>
      {
        'method': method,
        'type': loginType,
        'email': loginEmail,
        'pass': loginPass
      };

  /// call this function in the Register UI
  Map<String, dynamic> registerToJson(
          {required String method,
          String registerType = "user",
          required String registerEmail,
          String registerPass = '1',
          required String registerName,
          required String registerMobile}) =>
      {
        'method': method,
        'type': registerType,
        'email': registerEmail,
        'pass': registerPass,
        'name': registerName,
        'mobile': registerMobile
      };

  /// FromJson function that receives the response body in JSON format
  /// and saves the data to an object of this class
  User.fromJson(Map<String, dynamic> map)
      : type = map['type'],
        email = map['email'],
        pass = map['pass'],
        name = map['name'],
        mobile = map['mobile'],
        pic = map['pic'];
}
