import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/components/sections/text_form_login.dart';
import 'package:grupo_ferroeste/helpers/regex_validation.dart';
import 'package:grupo_ferroeste/themes/theme_colors.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crie sua conta'),
        backgroundColor: MainThemeColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextFormLogin(
                labelText: 'E-mail',
                isPassword: false,
                formIcon: Icons.email_outlined,
                iconColor: MainThemeColors.loginFormsIconsColor,
                borderColor: MainThemeColors.loginFormsBorderColor,
                textColor: MainThemeColors.loginFormsTextsColor),
            const TextFormLogin(
                labelText: 'Senha',
                isPassword: true,
                formIcon: Icons.lock_outline,
                iconColor: MainThemeColors.loginFormsIconsColor,
                borderColor: MainThemeColors.loginFormsBorderColor,
                textColor: MainThemeColors.loginFormsTextsColor),
            const TextFormLogin(
                labelText: 'Confirme sua senha',
                isPassword: true,
                formIcon: Icons.lock_outline,
                iconColor: MainThemeColors.loginFormsIconsColor,
                borderColor: MainThemeColors.loginFormsBorderColor,
                textColor: MainThemeColors.loginFormsTextsColor),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 7,
                    shape: const StadiumBorder(),
                    fixedSize: const Size(250, 30),
                    backgroundColor: MainThemeColors.loginButtonBackgroundColor,
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
    );
  }
}
