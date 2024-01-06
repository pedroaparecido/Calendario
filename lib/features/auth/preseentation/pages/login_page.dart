import 'package:flutter/material.dart';
import 'package:horario/features/admin/presentation/admin_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _senhaController = TextEditingController();

  bool isVisible = true;

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
                      hintText: 'Usuário',
                      icon: Icon(Icons.person),
                    ),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Digite seu usuário';
                      } else if (email != 'XXXXXXXX') {
                        return 'Usuário incorreto!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _senhaController,
                    strutStyle:
                        const StrutStyle(height: 1.6, forceStrutHeight: true),
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      icon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: isVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () => setState(() => isVisible = !isVisible),
                      ),
                    ),
                    obscureText: isVisible ? true : false,
                    validator: (senha) {
                      if (senha == null || senha.isEmpty) {
                        return 'Digite sua senha';
                      } else if (senha != 'XXXXXXXXXX') {
                        return 'Senha incorreta';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_emailController.text == 'lucasbruna' &&
                              _senhaController.text == 'lucasbruna123') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminPage()),
                            );
                          }
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