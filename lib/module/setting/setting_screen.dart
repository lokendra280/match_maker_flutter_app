
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../core/presentation/resources/size_constants.dart';
import '../../core/presentation/widget/forms/buttons.dart';
import '../about/presentation/about.dart';
import '../about/presentation/account_management.dart';
import '../profile/presentation/edit_profile.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(28, 144, 79, 1),
        title: const Text(
          "Setting",
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: SizedBox(
              height: 65,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: SC.lH, horizontal: SC.xLH),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search ",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: Colors.white),
                ),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.symmetric(vertical: SC.lH, horizontal: SC.lW),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                   Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),  
                  );  
                },
                child: const _settingFeatures(
                  title: "Edit Profile",
                  iconsImage: Icon(Icons.arrow_back),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  // context.pushRoute(BlockListRoute());
                },
                child: const _settingFeatures(
                  title: "Blocked List",
                  iconsImage: Icon(Icons.arrow_back),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                     Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) => const AccountManagement()),  
                  );  
                },
                child: const _settingFeatures(
                  title: "Account Management",
                  iconsImage: Icon(Icons.arrow_back),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const _settingFeatures(
                title: "Notifications",
                iconsImage: Icon(Icons.arrow_back),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(  
                  context,  
                  MaterialPageRoute(builder: (context) => const AboutUsPage()),  
                  );  
                  },
                child: const _settingFeatures(
                  title: "About Us",
                  iconsImage: Icon(Icons.arrow_back),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
        
                 const _settingFeatures(
                  title: "Language",
                  iconsImage: Icon(Icons.arrow_back),
                ),
              
              const SizedBox(
                height: 5,
              ),
              const _settingFeatures(
                title: "Help ?",
                iconsImage: Icon(Icons.arrow_back),
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                onPressed: (_) {
                  // showAnimatedDialog(
                  //     context: context,
                  //     widget: LogOutDialog(() {
                  //       ref.read(authProvider).logout();
                  //     }));
                },
                title: "Log Out",
                color: const Color.fromRGBO(28, 144, 79, 1),
                radius: 8,
              ),
              const SizedBox(
                height: 10,
              ),
              const _LoginoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _settingFeatures extends StatelessWidget {
  final String title;
  final iconsImage;
  const _settingFeatures({
    required this.title,
    required this.iconsImage,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SC.lH),
            child: Text(
              title,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: const Color.fromRGBO(5, 53, 53, 1),
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontSize: 11,
                  ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: SC.lH),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 10,
            ),
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
          "powered by MatchMaker",
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
