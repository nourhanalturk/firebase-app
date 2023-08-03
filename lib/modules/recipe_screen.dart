import 'package:firebase_app/cubit/app_cubit/cubit.dart';
import 'package:firebase_app/cubit/app_cubit/states.dart';
import 'package:firebase_app/modules/home_screen.dart';
import 'package:firebase_app/sharing/component/component.dart';
import 'package:firebase_app/style/iconBroken/iconBroken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeScreen extends StatelessWidget {

  final  recipeId ;


  const RecipeScreen({super.key, required this.recipeId});
  @override
  Widget build(BuildContext context) {
    final model = AppCubit.get(context)
        .breakfastInfo
        ?.firstWhere((data) => data.uId == recipeId);

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
        slivers: [
                SliverAppBar(
                   expandedHeight: MediaQuery.of(context).size.height / 1,
                   floating: false,
                   pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height /1,
                          child: Image.network(

                           model!.breakfastImg!,
                           fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height /1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.8),
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(1.0),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                model.breakfastDesc!,
                                style: TextStyle(fontSize: 35.0,color: Colors.white),
                              ),
                              Row(
                                children: [
                                  defaultText(text: 'By ', fontSize: 16.0, color: Colors.grey),
                                  defaultText(text: '${model.name!}', fontSize: 16.0, color: Colors.deepOrange),
                                  Spacer(),
                                  TextButton(onPressed: (){
                                   AppCubit.get(context).addToFollowing(model);
                                  },
                                      child: defaultText(text: '+Follow', fontSize: 16.0, color: Colors.deepOrange),
                                  )


                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  leading: IconButton(onPressed: (){Navigator.pop(context, MaterialPageRoute(builder:  (context) =>HomeScreen() ));}, icon: Icon(Icons.arrow_back_sharp,color: Colors.deepOrange,)) ,
                  actions: [
                  IconButton(onPressed: (){
                    AppCubit.get(context).addFavoriteRecipe(model);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Recipe added to favorites'),
                      ),
                    );
                  }, icon: Icon(IconBroken.Heart,color: Colors.white,size: 30.0,))
               ],
              ),
        ],
        ),
              Positioned.fill(
              top: MediaQuery.of(context).size.height * (0.6),
                child: Container(

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: (){
                                  AppCubit.get(context).changeSelectedHomeButton('Ingredients');
                                 // AppCubit.get(context).homeButton =false ;
                                },
                                child: defaultText(text: 'Ingredients', fontSize: 21.0,
                                    color: AppCubit.get(context).homeButtonIngredients ? Colors.black : Colors.grey),
                            ),
                            SizedBox(width: 5.0,),
                            TextButton(
                              onPressed: (){
                                AppCubit.get(context).changeSelectedHomeButton('Recipe');

                              },
                              child: defaultText(text: 'Recipe', fontSize: 21.0,
                                  color: AppCubit.get(context).homeButtonRecipe ? Colors.black : Colors.grey),),

                          ],
                        ),
                        if(AppCubit.get(context).buttonIdentifier == 'Ingredients')
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.access_time,color: Colors.deepOrange,),
                                      defaultText(text: '${model.time}', fontSize: 15.0, color: Colors.deepOrange),
                                      defaultText(text: ' min', fontSize: 15.0, color: Colors.deepOrange)

                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      defaultText(
                                          text: '3 portions',
                                          fontSize: 15.0,
                                          color: Colors.deepOrange),
                                      IconButton(
                                        icon:Icon(Icons.keyboard_arrow_down_outlined,color: Colors.deepOrange),
                                        onPressed: (){},
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                            ),
                            Row(
                              children: [
                                buildColumn(title: 'Calories',quantity: model.calories ,unit: 'Kcal'),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Container(
                                    height: 80.0,
                                    width: 4.0,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
                                  ),
                                ),
                                buildColumn(title: 'Proteins',quantity: model.proteins ,unit: 'Gram'),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                  child: Container(
                                    height: 80.0,
                                    width: 2.0,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
                                  ),
                                ),
                                buildColumn(title: 'Fats',quantity: model.fats ,unit: 'Gram'),


                              ],
                            ),
                          ],
                        ),
                        if(AppCubit.get(context).buttonIdentifier == 'Recipe')
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              defaultText(text: 'Recipe', fontSize: 20.0, color: Colors.deepOrange),
                              defaultText(text: model.recipe!, fontSize: 15.0, color: Colors.black),


                            ],
                          ),
                        )



                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

        );
      },
    );
  }
  Widget buildColumn({
    required title,
    required quantity,
    required  unit
}){
    return     Column(
      children: [
        defaultText(text: title, fontSize: 16.0, color: Colors.black),
        SizedBox(height: 4.0,),
        defaultText(text: '${quantity}', fontSize: 18.0, color: Colors.black),
        SizedBox(height: 4.0,),
        defaultText(text: unit, fontSize: 16.0, color: Colors.black),
      ],
    );
  }
}
