import 'package:firebase_app/cubit/app_cubit/cubit.dart';
import 'package:firebase_app/cubit/app_cubit/states.dart';
import 'package:firebase_app/network/local/shared_preference.dart';
import 'package:firebase_app/sharing/component/component.dart';
import 'package:firebase_app/style/iconBroken/iconBroken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sharing/constance.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(IconBroken.Setting,color: Colors.deepOrange,size: 30.0,),
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage:NetworkImage(
                          cubit.userModel!.profileImage!
                      ) ,
                      radius: 50.0,
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Center(child: defaultText(text: cubit.userModel!.name!, fontSize: 20.0, color: Colors.black)),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80.0,top: 10.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              defaultText(text: '${cubit.profilePublication}', fontSize: 18.0, color: Colors.black),
                              SizedBox(height: 8.0,),
                              defaultText(text: 'Publications', fontSize: 12.0, color: Colors.black),
                            ],
                          ),
                          SizedBox(width: 15.0,),
                          Column(
                            children: [
                              defaultText(text: '${cubit.profileFollowing}', fontSize: 18.0, color: Colors.black),
                              SizedBox(height: 8.0,),
                              defaultText(text: 'Following', fontSize: 12.0, color: Colors.black),
                            ],
                          ),
                          SizedBox(width: 15.0,),
                          Column(
                            children: [
                              defaultText(text: '${cubit.profileFollowers}', fontSize: 18.0, color: Colors.black),
                              SizedBox(height: 8.0,),
                              defaultText(text: 'Followers', fontSize: 12.0, color: Colors.black),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Row(
                    children: [
                      defaultText(text: 'Favourites', fontSize: 25.0, color: Colors.black),
                      Spacer(),
                      TextButton(
                        onPressed: (){},
                        child: defaultText(text: '+ Create a new list', fontSize: 15.0, color: Colors.deepOrange), )
                    ],
                  ),
                  SizedBox(
                    height: AppCubit.get(context).favoriteRecipes.isEmpty? 150.0:250.0 ,
                   child: Stack(
                     children: [
                       ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: AppCubit.get(context).favoriteRecipes.length ,
                        itemBuilder: (context, index) {
                       final recipe = AppCubit.get(context).favoriteRecipes[index];
                         return Column(
                           children: [
                             Container(
                               height: MediaQuery.of(context).size.height *0.22,
                               width: 180.0,
                               clipBehavior: Clip.antiAliasWithSaveLayer,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20.0),
                               ),
                               child: Image(
                                 image: NetworkImage( recipe.breakfastImg!),
                                 fit: BoxFit.cover,
                               ),
                             ),
                             const SizedBox(height: 8.0,),
                             defaultText(text: recipe.breakfastDesc!, fontSize: 16.0, color: Colors.grey)

                           ],
                         );
                },
                  separatorBuilder: (BuildContext context, int index) =>SizedBox(width: 10.0,),

              ),
                       Visibility(
                         visible: AppCubit.get(context).favoriteRecipes.isEmpty,
                         child: Center(
                           child: defaultText(
                             text: 'There is nothing in favorites',
                             fontSize: 18.0,
                             color: Colors.grey,
                           ),
                         ),
                       ),
                     ],
                   ),
            ),
                  defaultText(text: 'Published', fontSize: 25.0, color: Colors.black),
                  SizedBox(
                    height:AppCubit.get(context).breakfastInfo.isEmpty?150.0 : 250.0,
                    child: Stack(
                      children: [
                        ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: AppCubit.get(context).breakfastInfo.length,
                          itemBuilder: (context, index) {
                            final model = AppCubit.get(context).breakfastInfo[index];
                            if(model.userUid == CacheHelper.getData(key: 'uId')) {
                              return Column(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *0.22,
                                  width: 180.0,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Image(
                                    image: NetworkImage( model.breakfastImg!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 8.0,),
                               defaultText(text: model.breakfastDesc!, fontSize: 16.0, color: Colors.grey)

                              ],
                            );
                            }
                          },
                          separatorBuilder: (BuildContext context, int index) =>SizedBox(width: 10.0,),

                        ),
                        // Visibility(
                        //   visible ,
                        //   child: Center(
                        //     child: defaultText(
                        //       text: 'no posts yet',
                        //       fontSize: 18.0,
                        //       color: Colors.grey,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
        ],
              ),
            ),
          ),
        );
      },
    );
  }
}
