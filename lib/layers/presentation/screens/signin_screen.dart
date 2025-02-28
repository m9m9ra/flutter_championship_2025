import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/core/settings/color_settings.dart';
import 'package:matule/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final supabase = Supabase.instance.client;

  bool _passwordVisible = false;
  // ignore: unused_field
  bool _isLoading = false;

  Future<void> _signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await supabase.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim()
      );
      if (mounted) {
        context.showSnackBar('Check your email for a login link!');
        _emailController.clear();
        _passwordController.clear();
      }
    } on AuthException catch (error) {
      if (mounted) context.showSnackBar(error.message, isError: true);
    } catch (error) {
      if (mounted) {
        context.showSnackBar('Unexpected error occurred', isError: true);
        context.go('/home');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSettings().block,
      appBar: CupertinoNavigationBar(
        backgroundColor: ColorSettings().block,
        leading: IconButton.filled(
            padding: const EdgeInsets.all(10.0),
            onPressed: () => GoRouter.of(context).pop(),
            iconSize: 24.0,
            style: ButtonStyle(
                iconColor: const WidgetStatePropertyAll(Colors.black),
                backgroundColor:
                    WidgetStatePropertyAll(ColorSettings().background)),
            icon: const Icon(CupertinoIcons.chevron_back)),
        border: null,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 47.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // main - top
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Привет!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorSettings().text,
                          fontSize: 32.0,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8.0),
                  Text(
                      'Заполните Свои данные или\nпродолжите через социальные медиа',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorSettings().subTextDark,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(height: 30.0),

                  // form
                  Text('Email',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: ColorSettings().text,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 12.0),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.0,
                          color: ColorSettings().background,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                        color: ColorSettings().background),
                    height: 48.0,
                    child: TextField(
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: ColorSettings().accent,
                      controller: _emailController,
                      decoration: InputDecoration(
                        // labelText: 'email',
                        label: const Text('xyz@gmail.com'),
                        hintText: 'Enter your email',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
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

                  const SizedBox(height: 30.0),

                  // text-field pass
                  Text('Пароль',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: ColorSettings().text,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 12.0),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.0,
                          color: ColorSettings().background,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                        color: ColorSettings().background),
                    height: 48.0,
                    child: TextField(
                      enableSuggestions: true,
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      cursorColor: ColorSettings().accent,
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        // labelText: 'email',
                        label: const Text('*******'),
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: ColorSettings().hint,
                          ),
                          onPressed: () => setState(() {
                            _passwordVisible = !_passwordVisible;
                          }),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
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

                  const SizedBox(height: 12.0),
                  GestureDetector(
                    child: Text(
                      'Востановить',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: ColorSettings().subTextDark),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  CupertinoButton.filled(
                      borderRadius: BorderRadius.circular(14.0),
                      child: const Text('Войти'),
                      onPressed: () => _signIn())
                ],
              ),

              // ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Вы впервые?',
                      style: TextStyle(
                          color: ColorSettings().hint,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(width: 6.0),
                  Text('Создать пользователя',
                      style: TextStyle(
                          color: ColorSettings().text,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
