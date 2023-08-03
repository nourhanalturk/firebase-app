import 'package:firebase_app/cubit/app_cubit/cubit.dart';
import 'package:firebase_app/cubit/app_cubit/states.dart';
import 'package:firebase_app/sharing/component/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var ingredientOneController = TextEditingController();
    var ingredientTwoController = TextEditingController();
    var ingredientThreeController = TextEditingController();
    var recipeController = TextEditingController();
    var amount1Controller = TextEditingController();
    var amount2Controller = TextEditingController();
    var amount3Controller = TextEditingController();
    var timeController = TextEditingController();


    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Publish recipe',
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      defaultText(text: 'Photos and videos', fontSize: 20.0, color: Colors.black),
                      const SizedBox(height: 5.0,),
                      // Stack(
                      //   alignment: AlignmentDirectional.center,
                      //   children: [
                      //     Container(
                      //       width: 180,
                      //       height: 180,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(12.0),
                      //         border: Border.all(
                      //           color: Colors.orangeAccent[100]!,
                      //           width: 1.0,
                      //           style: BorderStyle.solid,
                      //         ),),
                      //
                      //
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(right: 70.0,bottom: 70.0),
                      //       child: IconButton(
                      //           onPressed: (){
                      //             print('hi');
                      //             AppCubit.get(context).getRecipeImage();
                      //           },
                      //           icon: Icon(Icons.add,color: Colors.deepOrange,size: 100.0,)
                      //       ),
                      //     ),
                      //   ],
                      // ),
                     MaterialButton(onPressed: (){
                       AppCubit.get(context).getRecipeImage();
                     },child: Text('click'),),
                      const SizedBox(height: 15.0,),
                      defaultText(text: 'Name', fontSize: 18.0, color: Colors.black),
                      const SizedBox(height: 8.0,),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),

                          ),
                          hintText: 'Apple pie',
                          fillColor: Colors.grey,

                        ),
                      ),
                      const SizedBox(height: 15.0,),
                      defaultText(text: 'Ingredients', fontSize: 18.0, color: Colors.black),
                      const SizedBox(height: 8.0,),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: ingredientOneController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                hintText: 'Calories',
                                fillColor: Colors.grey,
                                enabled: false ,

                              ),
                            ),
                          ),
                          SizedBox(width: 8.0,),
                          Expanded(
                            child: TextFormField(
                              controller: amount1Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),

                                ),
                                hintText: 'Amount',
                                fillColor: Colors.grey,

                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0,),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: ingredientTwoController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                hintText: 'Proteins',
                                fillColor: Colors.grey,
                                enabled: false
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0,),
                          Expanded(
                            child: TextFormField(
                              controller: amount2Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),

                                ),
                                hintText: 'Amount',
                                fillColor: Colors.grey,

                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0,),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: ingredientThreeController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                hintText: 'Fats',
                                fillColor: Colors.grey,
                                enabled: false ,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0,),
                          Expanded(
                            child: TextFormField(
                              controller: amount3Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),

                                ),
                                hintText: 'Amount',
                                fillColor: Colors.grey,

                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0,),
                      TextButton(
                          onPressed: (){},
                          child: defaultText(text: '+Add ingredient', fontSize: 18.0, color: Colors.deepOrange)
                      ),
                      const SizedBox(height: 10.0,),
                      defaultText(text: 'Recipe', fontSize: 18.0, color: Colors.black),
                      const SizedBox(height: 10.0,),
                      TextFormField(
                        controller: recipeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: 'Add the recipe details',
                          fillColor: Colors.grey,

                        ),
                      ),
                      defaultText(text: 'Time', fontSize: 18.0, color: Colors.black),
                      const SizedBox(height: 10.0,),
                      TextFormField(
                        controller: timeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: 'time',
                          fillColor: Colors.grey,

                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: MaterialButton(
                            onPressed: (){
                           AppCubit.get(context).uploadRecipeImage(
                               breakfastDesc: nameController.text,
                               ingredient1Amount: amount1Controller.text,
                               ingredient2Amount: amount2Controller.text,
                               ingredient3Amount: amount3Controller.text,
                               recipe:recipeController.text ,
                               time: timeController.text,

                           );
                           ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                               content: Text('Recipe added to favorites!'),
                             ),
                           );
                            },
                            child: Text('add',style: TextStyle(color: Colors.white),),))


                    ],
                  ),
                ),
              ),
            )
        );
      },
    );
  }
}

