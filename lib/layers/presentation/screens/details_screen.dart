import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/settings/color_settings.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
              context.pop();
            },
            color: ColorSettings().text,
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(ColorSettings().block)),
            icon: const Icon(CupertinoIcons.chevron_back)),
        middle: const Text('Sneaker Shop'),
        trailing: IconButton.filled(
            padding: const EdgeInsets.all(10.0),
            iconSize: 24.0,
            onPressed: () {
              // context.go('/favorite');
            },
            color: ColorSettings().text,
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(ColorSettings().block)),
            icon: const Icon(CupertinoIcons.bag)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 26.0, bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // product info ???
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Nike Air Max 270\nEssential',
                    style: TextStyle(
                        color: ColorSettings().text,
                        fontWeight: FontWeight.w700,
                        fontSize: 26.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text('Men’s Shoes',
                      style: TextStyle(
                          color: ColorSettings().hint,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0)),
                  const SizedBox(height: 8.0),
                  Text('₽179.39',
                      style: TextStyle(
                          color: ColorSettings().text,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0)),
                  const SizedBox(height: 14.0),
                  Container(
                      padding: const EdgeInsets.only(right: 20.0),
                      width: 241,
                      height: 125,
                      child: Image.asset(
                        'assets/nike_zoom.png',
                        fit: BoxFit.contain,
                      )),

                  const SizedBox(height: 28.0),
                  // ------------------
                  Container(
                    height: 58,
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [1, 2, 2, 2, 2, 2, 2, 2].map((toElement) {
                          return Container(
                            height: 56.0,
                            width: 56.0,
                            margin: const EdgeInsets.only(right: 14.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                                color: ColorSettings().block,
                                borderRadius: BorderRadius.circular(16.0)),
                            child: Image.asset('assets/nike_zoom.png'),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // ------------------
                  const SizedBox(height: 33.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                        'Вставка Max Air 270 обеспечивает непревзойденный комфорт в течение всего дня. Изящный дизайн ........',
                        style: TextStyle(
                            color: ColorSettings().hint,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0)),
                  ),

                  // --------------
                  const SizedBox(height: 9.0),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      child: Text('Подробнее',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: ColorSettings().accent,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0)),
                    ),
                  )
                ],
              ),
            ),

            //bottom button
            Container(
              height: 52.0,
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.filled(
                      padding: const EdgeInsets.all(14.0),
                      iconSize: 24.0,
                      onPressed: () {
                        // context.go('/favorite');
                      },
                      color: ColorSettings().text,
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(ColorSettings().block)),
                      icon: const Icon(CupertinoIcons.heart)),
                  const SizedBox(width: 18.0),
                  Flexible(
                    child: CupertinoButton.filled(
                        borderRadius: BorderRadius.circular(12.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 12.0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(CupertinoIcons.bag),
                            Text(
                              'В корзину',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w600),
                            ),
                            SizedBox()
                          ],
                        ),
                        onPressed: () {}),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
