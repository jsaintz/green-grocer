import 'package:flutter/material.dart';
import 'package:green_grocer/src/common/custom_text_field.dart';
import 'package:green_grocer/src/constants/constants.dart';
import 'package:green_grocer/src/services/utils_services.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: _buildSignIn(context),
        ),
      ),
    );
  }

  Stack _buildSignIn(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            _buildHeader(),
            _buildForm(),
          ],
        ),
        Positioned(
          top: 10,
          left: 10,
          child: SafeArea(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Expanded _buildHeader() {
    return const Expanded(
      child: Center(
        child: Text(
          'Cadastro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
      ),
    );
  }

  Container _buildForm() {
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
          const CustomTextField(icon: Icons.email, label: 'E-mail'),
          const CustomTextField(
            icon: Icons.lock,
            label: 'Senha',
            isSecret: true,
          ),
          const CustomTextField(icon: Icons.person, label: 'Nome'),
          CustomTextField(
            icon: Icons.phone,
            label: 'Celular',
            inputFormatters: [UtilsServices().phoneFormatter],
          ),
          CustomTextField(
            icon: Icons.file_copy,
            label: 'CPF',
            inputFormatters: [UtilsServices().cpfFormatter],
          ),
          _registerbutton()
        ],
      ),
    );
  }

  SizedBox _registerbutton() {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Cadastrar Usuário',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
