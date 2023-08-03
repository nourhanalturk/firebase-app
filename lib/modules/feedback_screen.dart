import 'package:firebase_app/cubit/app_cubit/cubit.dart';
import 'package:firebase_app/cubit/app_cubit/states.dart';
import 'package:firebase_app/models/feed_model.dart';
import 'package:firebase_app/sharing/component/component.dart';
import 'package:firebase_app/style/iconBroken/iconBroken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        if(AppCubit.get(context).feed == null){
          return Center(child: SingleChildScrollView());
        }else {
          return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                    child: defaultText(text: 'Feed', fontSize: 35.0, color: Colors.black)
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildFeeds(AppCubit.get(context).feed[index]),
                      separatorBuilder: (context, index) => const SizedBox(height: 15.0,),
                      itemCount:AppCubit.get(context).feed.length
                  ),
                ),
              ],
            ),
          ),
        );
        }
      },
    );
  }
  Widget buildFeeds (FeedModel feed){
    return
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20.0
          ,),
        Row(
          children: [
            CircleAvatar(
              backgroundImage:NetworkImage(
                feed.userImage!
              ) ,
              radius: 21.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            defaultText(text: feed.userName!, fontSize: 18.0, color: Colors.black),
            Spacer(),
            IconButton(
              onPressed: (){},
              icon: Icon(IconBroken.Heart,size: 30.0,),color: Colors.deepOrange,)
          ],
        ),
        const SizedBox(
          height: 10.0
          ,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              height: 400.0,
              width: double.infinity,
              image: NetworkImage(
                feed.postImage!
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 8.0
          ,),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: defaultText(text:feed.userComment!,
              fontSize: 18.0, color: Colors.black),
        )




      ],
    );
  }
}
