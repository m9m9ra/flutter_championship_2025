import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/settings/color_settings.dart';
import 'package:matule/layers/presentation/shared/ui/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isSearch = false;

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
                if (!_isSearch) {
                  context.go('/home');
                  return;
                }
                setState(() {
                  _isSearch = false;
                  FocusScope.of(context).unfocus();
                });
              },
              color: ColorSettings().text,
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(ColorSettings().block)),
              icon: const Icon(CupertinoIcons.chevron_back)),
          middle: Text(_isSearch ? 'Search' : 'Поиск')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            _isSearch = false;
          });
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 20.0),
              height: 52.0,
              width: double.maxFinite,
              child: Container(
                // width: !_isSearch ? 269.0 : 335,
                width: double.maxFinite,
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
                  onSubmitted: (_) => setState(() {
                    _isSearch = false;
                    FocusScope.of(context).unfocus();
                  }),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(CupertinoIcons.search),
                    suffixIcon: GestureDetector(
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
                    ),
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
            ),
            // card grid

            _isSearch
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    margin: const EdgeInsets.only(top: 24.0),
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
                : Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GridView.count(
                        primary: false,
                        crossAxisSpacing: 15,
                        shrinkWrap: true,
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
                  ),
          ],
        ),
      ),
    );
  }
}
