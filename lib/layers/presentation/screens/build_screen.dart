import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/settings/color_settings.dart';
import 'package:matule/layers/presentation/shared/ui/async_drawer_controller.dart';
import 'package:matule/layers/presentation/shared/ui/drawer_menu.dart';

// ignore: must_be_immutable
class BuildScreen extends StatefulWidget {
  const BuildScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<BuildScreen> createState() => _BuildScreenState();
}

class _BuildScreenState extends State<BuildScreen> {
  void _navigationOnIndex(int index) {
    widget.navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AsyncDrawerController>(
        builder: (_) => ZoomDrawer(
            borderRadius: 24.0,
            showShadow: false,
            angle: -3.0,
            menuScreenWidth: 375.0,
            mainScreenTapClose: true,
            menuBackgroundColor: ColorSettings().accent,
            drawerShadowsBackgroundColor: Colors.grey,
            slideWidth: MediaQuery.of(context).size.width * 0.64,
            // ignore: no_wildcard_variable_uses
            controller: _.zoomDrawerController,
            menuScreen: const DrawerMenu(),
            mainScreen: Scaffold(
              body: Stack(
                children: [
                  widget.navigationShell,
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 102.0,
                        width: double.maxFinite,
                        // color: ColorSettings().background,
                        color: Colors.transparent,
                        child: Stack(children: [
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/bottombar.png',
                                fit: BoxFit.fill,
                              )),
                          Container(
                            // elevation: 0.0,
                            height: 102.0,
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12.0),
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () => _navigationOnIndex(0),
                                    iconSize: 24.0,
                                    color:
                                        widget.navigationShell.currentIndex == 0
                                            ? ColorSettings().accent
                                            : ColorSettings().text,
                                    icon: const Icon(CupertinoIcons.home)),
                                IconButton(
                                    onPressed: () => _navigationOnIndex(1),
                                    iconSize: 24.0,
                                    color:
                                        widget.navigationShell.currentIndex == 1
                                            ? ColorSettings().accent
                                            : ColorSettings().text,
                                    icon: const Icon(CupertinoIcons.heart)),
                                const SizedBox(
                                  width: 72.0,
                                  height: 24.0,
                                ),
                                IconButton(
                                    onPressed: () => _navigationOnIndex(2),
                                    iconSize: 24.0,
                                    color:
                                        widget.navigationShell.currentIndex == 2
                                            ? ColorSettings().accent
                                            : ColorSettings().text,
                                    icon: const Icon(
                                        Icons.notifications_outlined)),
                                IconButton(
                                    onPressed: () => _navigationOnIndex(3),
                                    iconSize: 24.0,
                                    color:
                                        widget.navigationShell.currentIndex == 3
                                            ? ColorSettings().accent
                                            : ColorSettings().text,
                                    icon: const Icon(CupertinoIcons.person)),
                              ],
                            ),
                          ),
                          Positioned(
                              left: 0,
                              right: 0,
                              child: Center(
                                child: FloatingActionButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0)),
                                    elevation: 12.0,
                                    child: const Icon(
                                      CupertinoIcons.bag,
                                      size: 24.0,
                                    ),
                                    onPressed: () {}),
                              )),
                        ]),
                      ))
                ],
              ),
              backgroundColor: ColorSettings().background,
            )));
  }
}
