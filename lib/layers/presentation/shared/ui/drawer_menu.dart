import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matule/core/settings/color_settings.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 130.0, left: 20.0),
      color: ColorSettings().accent,
      child: const Column(
        children: [
          // SizedBox(
          //   height: 40.0,
          //   child: CupertinoButton(
          //     color: Colors.black54,
          //       child: Row(
          //         children: [
          //           Icon(Icons.logout),
          //           Text('Выйти')
          //         ],
          //       ),
          //       onPressed: () {
          //         Supabase.instance.client.auth.signOut();
          //       }),
          // )
        ],
      ),
    );
  }
}
