class HomeModel {
  String? breakfastDesc ;
  String? breakfastImg ;
  String? uId;

  HomeModel({
    this.breakfastDesc,
    this.breakfastImg,
    this.uId,
  });

  HomeModel.fromJson(Map<String,dynamic>json){
    breakfastDesc = json['breakfastDesc'];
    breakfastImg = json['breakfastImg'];
    uId = json['uId'];

  }

  Map<String,dynamic> toMap (){
    return {
      'breakfastDesc':breakfastDesc,
      'breakfastImg':breakfastImg,
      'uId':uId,

    };
  }

}