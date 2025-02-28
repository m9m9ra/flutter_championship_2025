import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:matule/core/settings/color_settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: ColorSettings().background,
        width: double.maxFinite,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          CupertinoNavigationBar(
            border: null,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            backgroundColor: ColorSettings().background,
            leading: IconButton(
                onPressed: () {
                  ZoomDrawer.of(context)?.toggle();
                },
                icon: const Icon(Icons.menu_sharp)),
            middle: const Text('Home'),
            trailing: IconButton.filled(
                padding: const EdgeInsets.all(10.0),
                iconSize: 24.0,
                onPressed: () {},
                color: ColorSettings().text,
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(ColorSettings().block)),
                icon: const Icon(CupertinoIcons.bag)),
          ),

          const SizedBox(height: 19.0),

          // search
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 52.0,
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 269.0,
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
                    decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.search),
                      // labelText: 'email',
                      label: const Text('xyz@gmail.com'),
                      hintText: 'Enter your email',
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
                IconButton.filled(
                    onPressed: () {},
                    padding: const EdgeInsets.all(14.0),
                    iconSize: 24.0,
                    icon: const Icon(Icons.tune_outlined))
              ],
            ),
          ),

          const SizedBox(height: 24.0),

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
                    children:
                        ['All', 'Outdoor', 'Tennis', 'Any'].map((toElement) {
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: ColorSettings().background,
            child: const Row(
              children: [
                
              ],
            ),
          )
        ]),
      ),
    );
  }
}
