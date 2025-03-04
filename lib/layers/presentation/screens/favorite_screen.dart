import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/settings/color_settings.dart';
import 'package:matule/layers/presentation/shared/ui/product_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSettings().background,
      appBar: CupertinoNavigationBar(
          border: null,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
          backgroundColor: ColorSettings().background,
          leading: IconButton.filled(
              padding: const EdgeInsets.all(10.0),
              iconSize: 24.0,
              onPressed: () {
                setState(() {
                  FocusScope.of(context).unfocus();
                  context.go('/home');
                });
              },
              color: ColorSettings().text,
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(ColorSettings().block)),
              icon: const Icon(CupertinoIcons.chevron_back)),
          middle: const Text('Favorite'),
          trailing: IconButton.filled(
              padding: const EdgeInsets.all(10.0),
              iconSize: 24.0,
              onPressed: () {},
              color: ColorSettings().text,
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(ColorSettings().block)),
              icon: const Icon(CupertinoIcons.heart))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          primary: false,
          crossAxisSpacing: 15,
          padding: const EdgeInsets.only(bottom: 82.0),
          mainAxisSpacing: 15,
          childAspectRatio: 160 / 182,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          crossAxisCount: 2,
          children: const <Widget>[
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
          ],
        ),
      ),
    );
  }
}
