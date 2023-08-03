class FeedModel {
  String? userImage ;
  String? userName ;
  String? userUid;
  String? postImage;
  String? postUid;
  String? userComment;
  FeedModel({
    this.userUid,
    this.postImage,
    this.userName,
    this.userComment,
    this.userImage,
    this.postUid
  });

  FeedModel.fromJson(Map<String,dynamic>json){
    userUid = json['userUid'];
    postImage = json['postImage'];
    userName = json['userName'];
    userComment = json['userComment'];
    userImage = json['userImage'];
    postUid = json['postUid'];

  }

  Map<String,dynamic> toMap (){
    return {
      'userUid':userUid,
      'postImage':postImage,
      'userName':userName,
      'userComment':userComment,
      'userImage':userImage,
      'postUid':postUid,
    };
  }

}