import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_maker/core/presentation/widget/forms/buttons.dart';
import 'package:match_maker/module/auth/data/model/user_model.dart';

import 'package:match_maker/module/auth/provider/auth_provider.dart';
import 'package:match_maker/module/home_screen/widget/drawer_profile.dart';
import 'package:provider/provider.dart';

import '../../core/presentation/resources/size_constants.dart';
import '../../core/presentation/resources/ui_assets.dart';
import '../../core/presentation/widget/image_slider/image_slider.dart';
import 'notifier/partner_notifier.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? user;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
              ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [MyHeaderDrawer()],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: SC.sH, vertical: SC.sH),
          child: Column(
            children: [
              SBC.lH,
              InkWell(
                onTap: () {},
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: SC.lH,vertical: SC.lW),
                      child: Row(
                      
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3,
                                          color: Color.fromRGBO(28, 144, 79, 1)),
                                      borderRadius: BorderRadius.circular(100.0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(ap.userModel.profilePic),
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SBC.xLW,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${ap.userModel.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 20, color: Colors.black),
                              ),
                              Text(
                                '${ap.userModel.uid}',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SBC.lH,
                  SizedBox(
                width: 500,
                height: 150,
                child: ImageSlider(
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: -15,
                  dotSize: 5,
                  images: [
                    Image.asset(
                      UIAssets.getDummyImage("1.jpg"),
                      width: double.infinity,
                      height: 0.5 * MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      UIAssets.getDummyImage("banners2.jpg"),
                      width: double.infinity,
                      height: 0.5 * MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SBC.xLH,
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: SC.sW, vertical: SC.mH),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Matching",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "View All",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              
              SBC.lH,
              SizedBox(
                width: double.infinity,
                height: 170,
                // implement ListView

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SC.lW, vertical: SC.mH),
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersonDetail()),
                            );
                          },
                          child: Column(
                            children: [
                              SBC.lH,
                          
                             CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1583391734039-1c611b6d9bd0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGluZGlhbiUyMGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                             ),
                             SBC.lW,
                              Text("Site Giri",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 20,
                                        color: Colors.black,
                                      )),
                              Text("Ktm",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 20,
                                        color: Colors.black,
                                      )),
                                      
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SBC.lH,
            ],
          ),
        ),
      ),
    );
  }
}


