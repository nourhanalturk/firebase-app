import 'package:firebase_app/cubit/app_cubit/cubit.dart';
import 'package:firebase_app/cubit/app_cubit/states.dart';
import 'package:firebase_app/style/iconBroken/iconBroken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class LayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.deepOrange,
              tabs: [
                GButton(icon: IconBroken.Home, text: 'Home'),
                GButton(icon: IconBroken.Search, text: 'Home'),
                GButton(icon: IconBroken.Upload, text: 'Home'),
                GButton(icon: Icons.list, text: 'Search'),
                GButton(icon: IconBroken.Profile, text: 'Profile'),
              ],
              selectedIndex: AppCubit.get(context).currentBottomNavIndex,
              onTabChange: (index) {
                AppCubit.get(context).changeBottomNavBar(index);
              },
            ),
          ),
        );
      },
    );
  }
}
