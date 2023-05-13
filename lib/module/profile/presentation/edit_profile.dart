import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/presentation/resources/size_constants.dart';
import '../../../core/presentation/resources/ui_assets.dart';
import '../../../core/presentation/widget/forms/buttons.dart';
import '../../../core/presentation/widget/forms/textfields.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Color.fromRGBO(244, 244, 244, 1),
                fontSize: 15,
              ),
        ),
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SC.mW, vertical: SC.mH),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.1, color: Colors.white),
                            borderRadius: BorderRadius.circular(100.0),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://www.looper.com/img/gallery/megan-foxs-big-regret-about-her-time-as-a-transformers-star/intro-1598364383.jpg',
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   top: 60,
                      //   left: 50,
                      //   width: 35,
                      //   height: 18,
                      //   child: SizedBox(
                      //     width: 50,
                      //     height: 60,
                      //     child: CircleAvatar(
                      //       radius: 5,
                      //       child: Image(
                      //         image: AssetImage(
                      //           UIAssets.getDummyImage(
                      //             'camera.png',
                      //           ),
                      //         ),
                      //       ),
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
      ),
      body: Container(
        child: Column(
          children: [
            SBC.sH,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "User Name",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color.fromRGBO(85, 79, 79, 1),
                        fontSize: 15,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ID:12345",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Color.fromRGBO(85, 79, 79, 1),
                        fontSize: 11,
                      ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: SC.lH, vertical: SC.mH),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full name",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  SBC.mH,
                  PrimaryTextField(
                    onSaved: (_) {},
                    hintTxt: "Anil  Abc",
                  ),
                  SBC.mH,
                  Text(
                    "Phone",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  SBC.mH,
                  PrimaryTextField(
                    onSaved: (_) {},
                    hintTxt: "981348******",
                  ),
                  SBC.mH,
                  Text(
                    "Gender ",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  SBC.mH,
                  PrimaryTextField(
                    onSaved: (_) {},
                    hintTxt: "Anil  Abc",
                  ),
                  SBC.lH,
                  Align(
                    alignment: Alignment.center,
                    child: PrimaryButton(
                      onPressed: (_) {},
                      title: "SAVE",
                      width: 204,
                      radius: 12,
                      color: const Color.fromRGBO(214, 40, 40, 1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileSettings extends StatelessWidget {
  final String imageTitle;
  final String title;
  const _ProfileSettings({
    required this.imageTitle,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SC.mW, vertical: SC.mH),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(UIAssets.getSvg(imageTitle)),
              SBC.xLW,
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}