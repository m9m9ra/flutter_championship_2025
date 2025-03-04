import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:http/http.dart';
import 'package:matule/core/settings/color_settings.dart';
import 'package:http/http.dart' as http;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Future<List<dynamic>> _notificationList;

  @override
  void initState() {
    // TODO: implement initState
    _notificationList = _getNotification();
    super.initState();
  }

  Future<List<dynamic>> _getNotification() async {
    Response _response =
        await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
    print(jsonDecode(_response.body)[0]);
    return jsonDecode(_response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSettings().block,
      appBar: CupertinoNavigationBar(
          border: null,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
          backgroundColor: ColorSettings().block,
          leading: IconButton(
              padding: const EdgeInsets.all(10.0),
              iconSize: 24.0,
              onPressed: () {
                setState(() {
                  FocusScope.of(context).unfocus();
                  ZoomDrawer.of(context)?.toggle();
                });
              },
              color: ColorSettings().text,
              icon: const Icon(Icons.menu_sharp)),
          middle: const Text('Notification')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
            future: _notificationList,
            builder: (context, snapshot) {
              print(snapshot);
              if (snapshot.hasData) {
                // return Text('${snapshot.data![0]['url']}');
                return SingleChildScrollView(
                  child: Column(
                    children: snapshot.data!.map((toElement) {
                      return Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(bottom: 12.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: ColorSettings().background,
                            borderRadius: BorderRadius.circular(16.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(toElement['slug'],
                                style: TextStyle(
                                    color: ColorSettings().text,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400)),
                            const SizedBox(height: 8.0),
                            Text(toElement['title'],
                                style: TextStyle(
                                    color: ColorSettings().text,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400)),
                            const SizedBox(height: 16.0),
                            Text(toElement['publishedAt'],
                                style: TextStyle(
                                    color: ColorSettings().subTextDark,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
