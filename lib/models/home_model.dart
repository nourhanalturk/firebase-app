class HomeModel {
  String? breakfastDesc ;
  String? breakfastImg ;
  String? uId;
  String? name;
  double? calories ;
  double? fats;
  double? time;
  double? proteins;
  String? recipe ;


  HomeModel({
    this.breakfastDesc,
    this.breakfastImg,
    this.uId,
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
    calories = json['calories'].toDouble();
    fats = json['fats'].toDouble();
    proteins = json['proteins'].toDouble();
    time = json['time'].toDouble();
    recipe = json['Recipe'];
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

    };
  }

}