import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/settings/color_settings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: ColorSettings().accent,
      body: OnBoardingSlider(
        finishButtonText: 'Далее',
        onFinish: () {
          context.push('/signin');
        },
        finishButtonTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: ColorSettings().text),
        finishButtonStyle: FinishButtonStyle(
            backgroundColor: ColorSettings().block,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0))),
        indicatorAbove: true,
        indicatorPosition: 124.0,
        // hasSkip: false,
        skipIcon: const Icon(CupertinoIcons.chevron_forward, color: Colors.black,),
        hasFloatingButton: true,
        // Костыль ебаный !
        skipTextButton: Text(''),
        trailing: Text(''),
        // ------------------
        trailingFunction: () {
          print('object');
        },
        controllerColor: ColorSettings().block,
        totalPage: 3,
        headerBackgroundColor: ColorSettings().accent,
        // pageBackgroundColor: ColorSettings().accent,
        pageBackgroundGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 1),
            colors: [
              Color.fromRGBO(72, 178, 231, 1),
              Color.fromRGBO(0, 118, 177, 1),
            ]),
        centerBackground: true,
        background: [
          Padding(
            padding: const EdgeInsets.only(top: 86.0),
            child: Image.asset(
              'assets/image_1.png',
              height: 400,
            ),
          ),
          Image.asset(
            'assets/image_2.png',
            height: 400,
          ),
          Image.asset(
            'assets/image_3.png',
            height: 400,
          ),
        ],
        speed: 1.8,
        pageBodies: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Добро \nпожаловать',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorSettings().block,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 340,
                ),
                Text(
                  'Начнем путешествие',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.w700,
                      color: ColorSettings().block),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Умная, великолепная и модная коллекция Изучите сейчас',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: ColorSettings().subTextLight),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 340,
                ),
                Text(
                  'У вас есть сила, чтобы',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.w700,
                      color: ColorSettings().block),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'В вашей комнате много красивых и привлекательных растений',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: ColorSettings().subTextLight),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
