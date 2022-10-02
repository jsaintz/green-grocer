import 'package:flutter/material.dart';
import 'package:green_grocer/src/common/custom_text_field.dart';
import 'package:green_grocer/src/constants/app_data.dart' as data;

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: const [
          CustomTextField(
            icon: Icons.email,
            label: 'Email',
          ),
          CustomTextField(
            icon: Icons.email,
            label: 'Nome',
          ),
          CustomTextField(
            icon: Icons.email,
            label: 'Celular',
          ),
          CustomTextField(
            icon: Icons.email,
            label: 'CPF',
            isSecret: true,
          ),
        ],
      ),
    );
  }
}
