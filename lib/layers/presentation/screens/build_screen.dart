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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AsyncDrawerController>(
        builder: (_) => ZoomDrawer(
            borderRadius: 24.0,
            showShadow: true,
            angle: -3.0,
            menuBackgroundColor: ColorSettings().accent,
            drawerShadowsBackgroundColor: Colors.grey,
            slideWidth: MediaQuery.of(context).size.width * 0.64,
            // ignore: no_wildcard_variable_uses
            controller: _.zoomDrawerController,
            menuScreen: const DrawerMenu(),
            mainScreen: Scaffold(
              body: widget.navigationShell,
              backgroundColor: ColorSettings().background,
              bottomNavigationBar: Container(
                height: 106.0,
                width: double.maxFinite,
                color: ColorSettings().background,
                child: Stack(children: [
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/bottombar.png',
                        fit: BoxFit.fill,
                      )),
                  Positioned(
                      left: 0,
                      right: 0,
                      child: Center(
                        child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            elevation: 12.0,
                            child: const Icon(
                              CupertinoIcons.bag,
                              size: 24.0,
                            ),
                            onPressed: () {}),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: BottomAppBar(
                      elevation: 0.0,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.home)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.home)),
                          const SizedBox(width: 72.0),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.home)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.home)),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            )));
  }
}
