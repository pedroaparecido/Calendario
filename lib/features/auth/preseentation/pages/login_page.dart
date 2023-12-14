import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horario/core/configs/route.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 500,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FlutterLogo(),
                  const SizedBox(height: 35),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label: Text('Usuário *'),
                      hintText: 'nome@email.com',
                      icon: Icon(Icons.person),
                    ),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Digite seu usuário';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  PasswordFormFieldWidget(senhaController: _senhaController),
                  const SizedBox(height: 25),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.offNamed(RouteConfig.admin);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[900],
                      ),
                      child: const Text('Login'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordFormFieldWidget extends StatefulWidget {
  const PasswordFormFieldWidget({
    super.key,
    required TextEditingController senhaController,
  }) : _senhaController = senhaController;

  final TextEditingController _senhaController;

  @override
  State<PasswordFormFieldWidget> createState() => _PasswordFormFieldWidgetState();
}

class _PasswordFormFieldWidgetState extends State<PasswordFormFieldWidget> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._senhaController,
      strutStyle: const StrutStyle(height: 1.6, forceStrutHeight: true),
      decoration: InputDecoration(
        labelText: 'Senha',
        icon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: isVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
          onPressed: () => setState(() => isVisible = !isVisible),
        ),
      ),
      obscureText: isVisible ? true : false,
      validator: (senha) {
        if (senha == null || senha.isEmpty) {
          return 'Digite sua senha';
        }
        return null;
      },
    );
  }
}
