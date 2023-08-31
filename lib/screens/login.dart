import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/components/sections/text_form_login.dart';
import 'package:grupo_ferroeste/helpers/regex_validation.dart';
import 'package:grupo_ferroeste/themes/theme_colors.dart';
import 'create_account.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, bottom: 40),
                child: Image.asset('assets/images/logo_gf.png'),
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: const [
                    TextFormLogin(
                        labelText: 'E-mail',
                        isPassword: false,
                        formIcon: Icons.email_outlined,
                        iconColor: MainThemeColors.loginFormsIconsColor,
                        borderColor: MainThemeColors.loginFormsBorderColor,
                        textColor: MainThemeColors.loginFormsTextsColor),
                    TextFormLogin(
                        labelText: 'Senha',
                        isPassword: true,
                        formIcon: Icons.lock_outline,
                        iconColor: MainThemeColors.loginFormsIconsColor,
                        borderColor: MainThemeColors.loginFormsBorderColor,
                        textColor: MainThemeColors.loginFormsTextsColor),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueceu sua senha?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.0,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 7,
                      shape: const StadiumBorder(),
                      fixedSize: const Size(250, 30),
                      backgroundColor:
                          MainThemeColors.loginButtonBackgroundColor,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18)),
                  child: const Text('Entrar'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não é cadastrado?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateAccount()));
                    },
                    child: const Text(
                      'Crie sua conta!',
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
