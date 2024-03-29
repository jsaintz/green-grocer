import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_grocer/src/common/app_name_widget.dart';
import 'package:green_grocer/src/common/custom_text_field.dart';
import 'package:green_grocer/src/pages/auth/sign_up_screen.dart';
import 'package:green_grocer/src/constants/constants.dart';
import 'package:green_grocer/src/routers/pages_routers.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<String> listFruits = ['Frutas', 'Verduras', 'Legumes', 'Carnes', 'Cereais', 'Laticíneos'];
    List<FadeAnimatedText> animatedTexts = listFruits.map((txt) => FadeAnimatedText(txt)).toList();

    return Scaffold(
      backgroundColor: Constants.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              _buildHeaderWidget(animatedTexts),
              _buildSignInForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSignInForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomTextField(
            icon: Icons.email,
            label: 'Email',
          ),
          const CustomTextField(
            icon: Icons.lock,
            label: 'Senha',
            isSecret: true,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () {
                Get.toNamed(PagesRouters.baseRoute);
              },
              child: const Text(
                'Entrar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  color: Constants.customContrastColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                    child: Divider(
                  color: Colors.grey.withAlpha(90),
                  thickness: 2,
                )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Ou'),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.withAlpha(90),
                    thickness: 2,
                  ),
                ),
              ],
            ),
          ),
          _createAccount(context)
        ],
      ),
    );
  }

  SizedBox _createAccount(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          side: const BorderSide(width: 2, color: Colors.green),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SignUpScreen(),
            ),
          );
        },
        child: const Text(
          'Criar conta',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Expanded _buildHeaderWidget(List<FadeAnimatedText> animatedTexts) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppNameWidget(
            greenTitleColor: Colors.white,
            textSize: 40,
          ),
          SizedBox(
            height: 30,
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: 25),
              child: AnimatedTextKit(
                pause: Duration.zero,
                repeatForever: true,
                animatedTexts: animatedTexts,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
