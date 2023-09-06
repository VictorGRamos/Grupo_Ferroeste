import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/components/sections/text_form_login.dart';
import 'package:grupo_ferroeste/services/api_login.dart';
import 'package:grupo_ferroeste/themes/theme_colors.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final loginObject = LoginService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crie sua conta'),
        backgroundColor: MainThemeColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormLogin(
                labelText: 'E-mail',
                isPassword: false,
                formIcon: Icons.email_outlined,
                iconColor: MainThemeColors.loginFormsIconsColor,
                borderColor: MainThemeColors.loginFormsBorderColor,
                textColor: MainThemeColors.loginFormsTextsColor,
                controller: emailController,
              ),
              TextFormLogin(
                labelText: 'Senha',
                isPassword: true,
                formIcon: Icons.lock_outline,
                iconColor: MainThemeColors.loginFormsIconsColor,
                borderColor: MainThemeColors.loginFormsBorderColor,
                textColor: MainThemeColors.loginFormsTextsColor,
                controller: passwordController,
              ),
              TextFormLogin(
                labelText: 'Confirme sua senha',
                isPassword: true,
                formIcon: Icons.lock_outline,
                iconColor: MainThemeColors.loginFormsIconsColor,
                borderColor: MainThemeColors.loginFormsBorderColor,
                textColor: MainThemeColors.loginFormsTextsColor,
                controller: passwordConfirmController,
                assistController: passwordController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    loginObject.checkAccountExist(emailController.text).then(
                      (value) {
                        if (value == false) {
                          loginObject.createAccont();
                        } else {
                          const snackBar = SnackBar(
                            content: Text(
                              'Esse e-mail já foi registrado',
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            behavior: SnackBarBehavior.floating,
                            elevation: 8,

                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 7,
                      shape: const StadiumBorder(),
                      fixedSize: const Size(250, 30),
                      backgroundColor:
                          MainThemeColors.loginButtonBackgroundColor,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18)),
                  child: const Text('Salvar'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Já possui uma conta?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Log-in!',
                      style: TextStyle(
                          color: MainThemeColors.loginCreateAccountTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
