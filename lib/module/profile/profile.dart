import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/presentation/resources/ui_assets.dart';
import '../../core/presentation/resources/size_constants.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(28, 144, 79, 1),
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.caption!.copyWith(
                // fontSize: 17,
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: SC.lW, vertical: SC.sH),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SBC.xxLH,
              Row(
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
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://www.looper.com/img/gallery/megan-foxs-big-regret-about-her-time-as-a-transformers-star/intro-1598364383.jpg',
                                ),
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
                        'Jeniffer Lawrence',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        'ID:12345',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
              SBC.xLH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(214, 40, 40, 0.2),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 7),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Image.asset(
                                UIAssets.getDummyImage('k1.png'),
                              ),
                            ),
                          ),
                          Text(
                            "100",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Color.fromRGBO(214, 40, 40, 1)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(28, 144, 79, 0.2),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 7),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Image.asset(
                                UIAssets.getDummyImage('k2.png'),
                              ),
                            ),
                          ),
                          Text(
                            "100",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    color: Color.fromRGBO(28, 144, 79, 1)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(73, 125, 182, 1),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 7),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Image.asset(
                                UIAssets.getDummyImage('k3.png'),
                              ),
                            ),
                          ),
                          Text(
                            "+ Add ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Color.fromRGBO(236, 233, 233, 1)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SBC.xLH,
              InkWell(
                onTap: () {
                  // context.pushRoute(ProfileDetailRoute());
                },
                child: const _settingFeatures(
                  title: "Profile",
                  image: "profile.png",
                ),
              ),
              SBC.mH,
              InkWell(
                onTap: () {
                  // context.pushRoute(const AddWalletRoute());
                },
                child: const _settingFeatures(
                  title: "Wallet",
                  image: "wallets.png",
                ),
              ),
              SBC.mH,
              InkWell(
                onTap: () {
                  // context.pushRoute(const SelectWallet());
                },
                child: const _settingFeatures(
                  title: "Add Wallet",
                  image: "wallet1.png",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _settingFeatures extends StatelessWidget {
  final String title;
  final String image;
  const _settingFeatures({
    required this.title,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.1,
        ),
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromRGBO(236, 233, 233, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SBC.sW,
          Image.asset(UIAssets.getDummyImage(image)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SC.lH),
            child: Text(
              title,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: const Color.fromRGBO(5, 53, 53, 1),
                    fontSize: 11,
                  ),
            ),
          ),
          const SizedBox(
            width: 180,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 10,
          ),
        ],
      ),
    );
  }
}

class _LoginoutButton extends StatelessWidget {
  const _LoginoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "powered by 21st Tech",
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}