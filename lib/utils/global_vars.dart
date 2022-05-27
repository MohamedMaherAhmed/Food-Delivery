import 'dart:convert';
import 'dart:ui';
import '../data_modules/restaurants/categories.dart';
import '../data_modules/restaurants/food.dart';
import '../data_modules/restaurants/restaurant.dart';
import '../data_modules/user_info.dart';
import 'package:food_delivery/utils/back_end_const_vars.dart' as backend;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

List<Food>? foodList = [];
List<Restaurant>? restaurantList = [];
List<Categories>? categoriesList = [];
List<User>? userList = [];
Categories categories = Categories();
User user = User();
int firstTimeDoneCounter = 0;
Map<String, dynamic>? respMap;
SharedPreferences? prefs;
Map<String, dynamic> colorMap = {
  'Orange_Color': const Color(0xFFFE724C),
  'Anything_White': const Color(0xFFFFFFFF),
  'Anything_Black': const Color(0xFF000000),
  'Black_With_Font_Weight_700': const Color(0xFF111719),
  'Welcome_UI_Small_Body_Paragraphs': const Color(0xFF30384F),
  'Welcome_UI_Bottom_Part_Gradient_Coloring_First_Color': const Color(0xFF494D63),
  'Welcome_UI_Bottom_Part_Gradient_Coloring_Second_Color': const Color(0xFF191B2F),
  'Welcome_UI_FB_Button_Icon_BackGround_Color': const Color(0xFF1877F2),
  'Welcome_UI_Email_Login_Button_Text_Color': const Color(0xFFFEFEFE),
};

/// Shared Preferences GetInstance Func
// ****************************************************************************
Future<void> getSharedPreferencesInstance() async {
  prefs = await SharedPreferences.getInstance();
  prefs?.setBool('loggedIn', false);
  prefs?.setBool('first_time_done', false);
}

/// Method Getting Functions
//****************************************************************************
Map<String, dynamic> getHomeMethod() {
  return categories.toJson(backend.homeMethod);
}

Map<String, dynamic> getLoginMethod(String loginEMAIL) {
  return user.loginToJson(method: backend.loginMethod, loginEmail: loginEMAIL);
}

Map<String, dynamic> getRegisterMethod(
    {required String registerEMAIL,
    required String registerMOBILE,
    required String registerNAME}) {
  return user.registerToJson(
      method: backend.registerMethod,
      registerEmail: registerEMAIL,
      registerMobile: registerMOBILE,
      registerName: registerNAME);
}

/// Func to receive or fill a User's info
// ****************************************************************************
Future<void> saveUserInfo() async {
  userList?.add(User.fromJson(respMap!));
  /// after the user data is saved, I noticed that there may be duplicates in
  /// the data of the list in the case of logging out then logging in again
  /// but got the idea to just clear the userList completely
  /// if the user logs out from the app
  /// use this line userList?.clear();
}

/// Home Info Getting Functions
// ****************************************************************************
Future<void> getCatObjList() async {
  /// Loop to get the Categories from back-end & assign it to a global list
  for (int i = 0; i < respMap?['categories'].length; i++) {
    categoriesList?.add(Categories.fromJson(respMap?['categories'][i]));
  }
}

Future<void> getRestaurantObjList() async {
  /// Loop to get the Restaurants from back-end & assign it to a global list
  for (int i = 0; i < respMap?['restaurants'].length; i++) {
    restaurantList?.add(Restaurant.fromJson(respMap?['restaurants'][i]));
  }
}

Future<void> getFoodObjList() async {
  /// Loop to get the Food from back-end & assign it to a global list
  for (int i = 0; i < respMap?['foods'].length; i++) {
    foodList?.add(Food.fromJson(respMap?['foods'][i]));
  }
}

/// Home Request Function and Function call -> postData();
// ****************************************************************************
/// Is called inside the scope of the initState() func
/// to initialize multiple lists of data to be shown later
Future<void> postData() async {
  final response = await http.post(
    Uri.parse(backend.url),
    body: getHomeMethod(),
  );

  if (response.statusCode == 200) {
    respMap = jsonDecode(response.body);
    getCatObjList();
    getRestaurantObjList();
    getFoodObjList();
  } else {
    throw Exception('RESPONSE STATUS: ${response.statusCode}');
  }
}

/// Utility Functions
dynamicDelay({int? sec, int? milliSec}) async {
  if (sec != null) {
    await Future.delayed(Duration(seconds: sec));
  } else if (milliSec != null) {
    await Future.delayed(Duration(milliseconds: milliSec));
  }else if (sec != null && milliSec != null){
    await Future.delayed(Duration(seconds: sec, milliseconds: milliSec));
  }
}

