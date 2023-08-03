class UserModel {
  String? name ;
  String? email ;
  String? phone;
  String? uId;
  String? profileImage;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.profileImage,
});

  UserModel.fromJson(Map<String,dynamic>json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    profileImage = json['profileImage'];
  }

  Map<String,dynamic> toMap (){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'profileImage':profileImage,


    };
  }

}