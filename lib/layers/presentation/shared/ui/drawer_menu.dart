import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/settings/color_settings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // ZoomDrawer.of(context)?.open();
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 84.0, left: 20.0),
      color: ColorSettings().accent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // nav button link
          const SizedBox(height: 58.0),

          SizedBox(
            height: 24.0,
            width: 170.0,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              color: Colors.transparent,
                child: const Row(
                  children: [
                    Icon(CupertinoIcons.person),
                    SizedBox(width: 27.0),
                    Text('Профиль')
                  ],
                ),
                onPressed: () {
                  ZoomDrawer.of(context)?.close();
                  context.go('/profile');
                }),
          ),
          const SizedBox(height: 30),

          SizedBox(
            height: 24.0,
            width: 170.0,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              color: Colors.transparent,
                child: const Row(
                  children: [
                    Icon(CupertinoIcons.bag),
                    SizedBox(width: 27.0),
                    Text('Корзина')
                  ],
                ),
                onPressed: () {
                  ZoomDrawer.of(context)?.close();
                  context.go('/profile');
                }),
          ),
          const SizedBox(height: 30),

          SizedBox(
            height: 24.0,
            width: 170.0,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              color: Colors.transparent,
                child: const Row(
                  children: [
                    Icon(CupertinoIcons.heart),
                    SizedBox(width: 27.0),
                    Text('Избранное')
                  ],
                ),
                onPressed: () {
                  ZoomDrawer.of(context)?.close();
                  context.go('/favorite');
                }),
          ),
          const SizedBox(height: 30),

          SizedBox(
            height: 24.0,
            width: 170.0,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              color: Colors.transparent,
                child: const Row(
                  children: [
                    Icon(Icons.delivery_dining_outlined),
                    SizedBox(width: 27.0),
                    Text('Заказы')
                  ],
                ),
                onPressed: () {
                  ZoomDrawer.of(context)?.close();
                  context.go('/favorite');
                }),
          ),
          const SizedBox(height: 30),

          SizedBox(
            height: 24.0,
            width: 170.0,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              color: Colors.transparent,
                child: const Row(
                  children: [
                    Icon(Icons.notifications_outlined),
                    SizedBox(width: 27.0),
                    Text('Уведомления')
                  ],
                ),
                onPressed: () {
                  ZoomDrawer.of(context)?.close();
                  context.go('/notification');
                }),
          ),
          const SizedBox(height: 30),

          SizedBox(
            height: 24.0,
            width: 170.0,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              color: Colors.transparent,
                child: const Row(
                  children: [
                    Icon(CupertinoIcons.gear),
                    SizedBox(width: 27.0),
                    Text('Настройки')
                  ],
                ),
                onPressed: () {
                }),
          ),
          
          const SizedBox(height: 38),

          // logout
          const Divider(color: Color.fromRGBO(247, 247, 249, 0.23)),        
          const SizedBox(height: 30),
          
          SizedBox(
            height: 24.0,
            width: 170.0,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              color: Colors.transparent,
                child: const Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 27.0),
                    Text('Выйти')
                  ],
                ),
                onPressed: () {
                  Supabase.instance.client.auth.signOut();
                  context.go('/onboarding');
                }),
          )
        ],
      ),
    );
  }
}
