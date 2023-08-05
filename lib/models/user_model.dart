class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? profileImage;

  static const String _defaultProfileImage =
      'https://cdn-icons-png.flaticon.com/512/172/172163.png?w=740&t=st=1691245177~exp=1691245777~hmac=71d56ddf28f481789aaa55e8829820d9b3f28ad318af5c17ff3fc9a7ac3d5b33';

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.profileImage,
  }) {
    // Assign the default profile image if it's not provided
    profileImage ??= _defaultProfileImage;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    profileImage = json['profileImage'] ?? _defaultProfileImage;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'profileImage': profileImage,
    };
  }
}
