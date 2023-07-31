class HomeModel {
  String? breakfastDesc ;
  String? breakfastImg ;
  String? userUid;
  String? uId;
  String? name;
  String? calories ;
  String? fats;
  String? time;
  String? proteins;
  String? recipe ;


  HomeModel({
    this.breakfastDesc,
    this.breakfastImg,
    this.uId,
    this.userUid,
    this.name,
    this.calories,
    this.fats,
    this.proteins,
    this.time,
    this.recipe,
  });

  HomeModel.fromJson(Map<String,dynamic>json){
    breakfastDesc = json['breakfastDesc'];
    breakfastImg = json['breakfastImg'];
    uId = json['uId'];
    name = json['name'];
    calories = json['calories'];
    fats = json['fats'];
    proteins = json['proteins'];
    time = json['time'];
    recipe = json['Recipe'];
    userUid = json['userUid'];

  }

  Map<String,dynamic> toMap (){
    return {
      'breakfastDesc':breakfastDesc,
      'breakfastImg':breakfastImg,
      'uId':uId,
      'name':name,
      'calories':calories,
      'fats':fats,
      'proteins':proteins,
      'time':time,
      'Recipe': recipe,
      'userUid':userUid ,
    };
  }

}