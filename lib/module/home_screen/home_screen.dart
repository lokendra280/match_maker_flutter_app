import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/presentation/resources/size_constants.dart';
import '../../core/presentation/resources/ui_assets.dart';
import '../../core/presentation/widget/image_slider/image_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 18,
              ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: SC.sH, vertical: SC.sH),
          child: Column(
            children: [
              SBC.lH,
              Card(
                child: SizedBox(
                  width: 1 * MediaQuery.of(context).size.width,
                  height: 160,
                  child: ImageSlider(
                    dotPosition: DotPosition.bottomCenter,
                    dotVerticalPadding: -15,
                    dotSize: 5,
                    images: [
                      Image.asset(
                        UIAssets.getDummyImage("banners1.jpg"),
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
              ),
              const SizedBox(
                height: SC.lH,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
