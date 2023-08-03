import 'package:firebase_app/cubit/app_cubit/cubit.dart';
import 'package:firebase_app/cubit/app_cubit/states.dart';
import 'package:firebase_app/sharing/component/component.dart';
import 'package:firebase_app/style/iconBroken/iconBroken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              IconButton(onPressed: (){}, icon: Icon(IconBroken.Setting,color: Colors.deepOrange,size: 30.0,))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage:NetworkImage(
                        cubit.userModel!.profileImage!
                    ) ,
                    radius: 50.0,
                  ),
                ),
                SizedBox(height: 10.0,),
                defaultText(text: cubit.userModel!.name!, fontSize: 20.0, color: Colors.black),
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
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    defaultText(text: 'Favourites', fontSize: 25.0, color: Colors.black),
                    Spacer(),
                    TextButton(
                      onPressed: (){},
                      child: defaultText(text: '+ Create a new list', fontSize: 15.0, color: Colors.deepOrange), )
                  ],
                )



              ],
            ),
          ),
        );
      },
    );
  }
}
