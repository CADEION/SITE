import 'package:flutter/material.dart';
import 'package:site/core/constants/my_assets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(MyAssets.assetsImagesHomeImage),fit: BoxFit.fill),
        ),
      ),
    );
  }
}