import 'package:firebase_app/style/iconBroken/iconBroken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var searchController =TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0,top: 40.0,right: 20.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Search',
                  fillColor: Colors.grey,
                  suffixIcon: Icon(IconBroken.Search)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
