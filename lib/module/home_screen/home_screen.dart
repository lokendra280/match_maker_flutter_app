import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_maker/core/presentation/widget/forms/buttons.dart';
import 'package:match_maker/module/auth/data/model/user_model.dart';

import 'package:match_maker/module/auth/provider/auth_provider.dart';
import 'package:match_maker/module/home_screen/widget/drawer_profile.dart';
import 'package:provider/provider.dart';

import '../../core/presentation/resources/size_constants.dart';
import '../../core/presentation/resources/ui_assets.dart';
import '../../core/presentation/widget/dialogs.dart';
import '../../core/presentation/widget/image_slider/image_slider.dart';
import '../auth/shared/logout_dialog.dart';
import '../chat_screen.dart/domain/api.dart';
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
                                radius: 30,
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
                                '${ap.userModel.id}',
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
                child:  StreamBuilder(
      stream: APIs.getspecuser(),
      builder: (context, snapshot){
      switch (snapshot.connectionState){
        case ConnectionState.waiting:
        case ConnectionState.none:
        return const Center(child: CircularProgressIndicator());
        case ConnectionState.active:
        case ConnectionState.done:
            final list = [];
      
        final data = snapshot.data?.docs;
      for (var i in data!){
        print('Data: ${i.data()}');
        list.add(i.data()['name']);
        // list.add(i.data()['profilePic']);
      }
      // log('Data: $ ');
      
      return ListView.builder(
      
      itemCount: list.length,
      padding: EdgeInsets.only(top: .01 * MediaQuery.of(context).size.height ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index){
      return InkWell(
        onTap: () {
         
        },
        child: Card(
        margin: EdgeInsets.symmetric(horizontal: .04 * MediaQuery.of(context).size.width , vertical: 4),
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
        onTap: () {
        
           //Navigator.push(context, MaterialPageRoute(builder: (_) => Chat(user: widget.user) ));
        },
        child:  InkWell(
          onTap: () {
               showAnimatedDialog(
                    context: context,
                    widget: LogOutDialog(() {
                    }));
          },
          child: ListTile(
            leading: CachedNetworkImage(
            width: .055 * MediaQuery.of(context).size.width,
            height: .055 * MediaQuery.of(context).size.height,
            imageUrl: '',
             errorWidget: (context, url, error) => const Icon(CupertinoIcons.person),
             ),
            title: Text('${list[index]}'),
            subtitle: const Text("Last User message", maxLines: 1,),
            trailing: const Text("12:00 PM",style: TextStyle(color: Colors.black54),),
          ),
        ),
        ),
          ),
      );
      }
      );
      }
    
      }
      )
      ),
      SBC.xLH,
      PrimaryButton(onPressed: (){}, title: "View More", width: 150, radius: 20,)
            ],
          ),
        ),
      ),
    );
  }
}


