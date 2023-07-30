import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_app/cubit/app_cubit/cubit.dart';
import 'package:firebase_app/cubit/app_cubit/states.dart';
import 'package:firebase_app/models/home_model.dart';
import 'package:firebase_app/modules/recipe_screen.dart';
import 'package:firebase_app/sharing/component/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height *0.5,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Image(
                            image: NetworkImage( 'https://img.freepik.com/free-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-19744.jpg?w=996&t=st=1690652452~exp=1690653052~hmac=a9c2f738802fd0aa60aae919fce7e2f0cb25a7857bec218842e607215809f15f'),
                            fit: BoxFit.cover,


                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height *0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.0),
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.8),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('\tRecipe\n of the day',style: TextStyle(fontSize: 30.0,color: Colors.white),),
                        )
                      ],
                    ),
                    const SizedBox(height: 10.0,),
                    Row(
                      children: [
                        defaultText(text: 'Breakfast', fontSize: 25.0, color: Colors.black),
                        Spacer(),
                        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_outlined,color: Colors.deepOrange,))
                      ],
                    ),
                    const SizedBox(height: 8.0,),
                    ConditionalBuilder(
                      condition:AppCubit.get(context).breakfastInfo.length >0 ,
                      builder: (context) =>  SizedBox(
                        height: MediaQuery.of(context).size.height *(0.3),
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) =>buildBreakfastContainer(context,AppCubit.get(context).breakfastInfo[index]),
                          separatorBuilder: (BuildContext context, int index)=>SizedBox(width: 8.0,),
                          itemCount:AppCubit.get(context).breakfastInfo.length ,

                        ),
                      ),
                      fallback: (context) => Center(child: CircularProgressIndicator()),
                    ),


                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  Widget buildBreakfastContainer(context,HomeModel homeModel){
    return InkWell(
      onTap: (){
       Navigator.push(context, MaterialPageRoute(builder:  (context) => RecipeScreen(recipeId: homeModel.uId),));
      },
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height *0.22,
            width: 180.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image(
              image: NetworkImage( homeModel.breakfastImg!),
              fit: BoxFit.cover,


            ),
          ),
          const SizedBox(height: 8.0,),
          defaultText(text: homeModel.breakfastDesc!, fontSize: 16.0, color: Colors.grey)

        ],
      ),
    );
  }
}
