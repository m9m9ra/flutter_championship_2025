import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:matule/core/settings/color_settings.dart';
import 'package:matule/layers/presentation/shared/ui/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearch = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _isSearch = false;
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: ColorSettings().background,
        width: double.maxFinite,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          CupertinoNavigationBar(
            border: null,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            backgroundColor: ColorSettings().background,
            leading: _isSearch
                ? IconButton.filled(
                    padding: const EdgeInsets.all(10.0),
                    iconSize: 24.0,
                    onPressed: () {
                      setState(() {
                        _isSearch = false;
                        FocusScope.of(context).unfocus();
                      });
                    },
                    color: ColorSettings().text,
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorSettings().block)),
                    icon: const Icon(CupertinoIcons.chevron_back))
                : IconButton(
                    onPressed: () {
                      ZoomDrawer.of(context)?.toggle();
                    },
                    icon: const Icon(Icons.menu_sharp)),
            middle: Text(_isSearch ? 'Search' : 'Главная'),
            trailing: !_isSearch
                ? IconButton.filled(
                    padding: const EdgeInsets.all(10.0),
                    iconSize: 24.0,
                    onPressed: () {},
                    color: ColorSettings().text,
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorSettings().block)),
                    icon: const Icon(CupertinoIcons.bag))
                : null,
          ),

          const SizedBox(height: 19.0),

          // search
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 52.0,
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: _isSearch
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: !_isSearch ? 269.0 : 335,
                  decoration: BoxDecoration(
                      color: ColorSettings().block,
                      borderRadius: BorderRadius.circular(14.0),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: Color.fromRGBO(0, 0, 0, 0.04))
                      ]),
                  child: TextField(
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: ColorSettings().accent,
                    onTap: () => setState(() {
                      _isSearch = true;
                    }),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.search),
                      suffixIcon: _isSearch
                          ? GestureDetector(
                              child: SizedBox(
                                width: 24,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 24.0,
                                      width: 1.0,
                                      color: ColorSettings().subTextDark,
                                    ),
                                    const SizedBox(width: 12.0),
                                    const Icon(CupertinoIcons.mic)
                                  ],
                                ),
                              ),
                            )
                          : null,
                      // labelText: 'email',
                      label: const Text('Search'),
                      hintText: 'Search',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.0, color: ColorSettings().background),
                          borderRadius: BorderRadius.circular(14.0)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.0, color: ColorSettings().background),
                          borderRadius: BorderRadius.circular(14.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.0, color: ColorSettings().background),
                          borderRadius: BorderRadius.circular(14.0)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.0, color: ColorSettings().background),
                          borderRadius: BorderRadius.circular(14.0)),
                    ),
                  ),
                ),
                if (!_isSearch)
                  IconButton.filled(
                      onPressed: () {},
                      padding: const EdgeInsets.all(14.0),
                      iconSize: 24.0,
                      icon: const Icon(Icons.tune_outlined))
              ],
            ),
          ),

          const SizedBox(height: 24.0),

          _isSearch
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.maxFinite,
                  color: ColorSettings().background,
                  child: Column(
                    children: [0, 0, 1].map((el) {
                      return GestureDetector(
                        onTap: () {
                          if (kDebugMode) {
                            print('History tap');
                          }
                        },
                        child: Container(
                          height: 22.0,
                          width: double.maxFinite,
                          color: Colors.transparent,
                          margin: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              const Icon(CupertinoIcons.clock),
                              const SizedBox(width: 12.0),
                              Text(
                                'New Shoes',
                                style: TextStyle(
                                    color: ColorSettings().text,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              : Column(
                  children: [
                    // category
                    Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      width: double.maxFinite,
                      height: 76.0,
                      color: ColorSettings().background,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Категории',
                            style: TextStyle(
                                color: ColorSettings().text,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: ['All', 'Outdoor', 'Tennis', 'Any']
                                  .map((toElement) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 16.0),
                                  height: 40.0,
                                  child: CupertinoButton(
                                      color: ColorSettings().block,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 11.0, horizontal: 42.0),
                                      child: Text(
                                        toElement,
                                        style: TextStyle(
                                            color: ColorSettings().text,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {}),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 24.0),

                    // popular
                    Container(
                      height: 24.0,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      color: ColorSettings().background,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Популярное',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  color: ColorSettings().text)),
                          GestureDetector(
                            child: Text('Все',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                    color: ColorSettings().accent)),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30.0),

                    // product card container
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      color: ColorSettings().background,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProductCard(),
                          ProductCard(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 29.0),

                    // action
                    Container(
                      height: 24.0,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      color: ColorSettings().background,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Акции',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  color: ColorSettings().text)),
                          GestureDetector(
                            child: Text('Все',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                    color: ColorSettings().accent)),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 19.0),

                    // image - may be fix
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        width: double.maxFinite,
                        child: Image.asset(
                          'assets/action.png',
                          fit: BoxFit.contain,
                        ))
                  ],
                )
        ]),
      ),
    );
  }
}
