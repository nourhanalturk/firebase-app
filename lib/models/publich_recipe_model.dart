// class PublishRecipeModel {
//   String? recipeImage ;
//   String? recipeDesc ;
//   String? uId; //my uid
//   String? name; // my name
//   String? ingredient1 ;
//   String? ingredient2;
//   String? ingredient3;
//   String? amount1 ;
//   String? amount2 ;
//   String? amount3 ;
//   String? recipeDetails;
//
//
//   PublishRecipeModel({
//     this.uId,
//     this.name,
//     this.ingredient1,
//     this.ingredient2,
//     this.ingredient3,
//     this.amount1,
//     this.amount2,
//     this.amount3,
//     this.recipeImage,
//     this.recipeDesc,
//     this.recipeDetails,
//   });
//
//   PublishRecipeModel.fromJson(Map<String,dynamic>json){
//     uId = json['uId'];
//     name = json['name'];
//     ingredient1 = json['ingredient1'];
//     ingredient2 = json['ingredient2'];
//     ingredient3 = json['ingredient3'];
//     amount1 = json['amount1'];
//     amount2 = json['amount2'];
//     amount3 = json['amount3'];
//     recipeImage = json['recipeImage'];
//     breakfastDesc = json['breakfastDesc'];
//     breakfastImg = json['breakfastImg'];
//   }
//
//   Map<String,dynamic> toMap (){
//     return {
//       'ingredient2':ingredient2,
//       'ingredient3':ingredient3,
//       'uId':uId,
//       'name':name,
//       'amount2':amount2,
//       'amount1':amount1,
//       'amount3':amount3,
//       'time':time,
//       'Recipe': recipe,
//
//     };
//   }
//
// }