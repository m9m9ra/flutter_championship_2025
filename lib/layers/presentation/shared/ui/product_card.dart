import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matule/core/settings/color_settings.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});
  final bool falorite = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      height: 182.0,
      decoration: BoxDecoration(
          color: ColorSettings().block,
          borderRadius: BorderRadius.circular(16.0)),
      child: Stack(
        children: [
          Positioned(
              right: 0.0,
              bottom: 0.0,
              child: Container(
                height: 34.0,
                width: 34.0,
                decoration: BoxDecoration(
                  color: ColorSettings().accent,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(16.0),
                    topLeft: Radius.circular(16.0),
                  ),
                ),
                child: IconButton.filled(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.add)),
              )),
          Positioned(
              left: 9.0,
              top: 9.0,
              child: SizedBox(
                height: 29.0,
                width: 29.0,
                child: IconButton.filled(
                    iconSize: 18.0,
                    color:
                        falorite ? ColorSettings().red : ColorSettings().text,
                    padding: const EdgeInsets.all(6.0),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(ColorSettings().background)),
                    onPressed: () {},
                    icon: Icon(falorite
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart)),
              )),
          Padding(
            padding: const EdgeInsets.only(
                left: 9.0, right: 9.0, top: 18.0, bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 70.0,
                  child: Image.asset('assets/nike_zoom.png')),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  'Best Seller'.toUpperCase(),
                  style: TextStyle(
                    color: ColorSettings().accent,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Text(
                  'Nike Air Max',
                  style: TextStyle(
                    color: ColorSettings().hint,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Text(
                  '₽752.00',
                  style: TextStyle(
                    color: ColorSettings().text,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
