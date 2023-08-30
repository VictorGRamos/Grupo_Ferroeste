import 'package:flutter/material.dart';
import 'package:grupo_ferroeste/helpers/regex_validation.dart';
import 'package:grupo_ferroeste/themes/theme_colors.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crie sua conta'), backgroundColor: MainThemeColors.primaryColor,),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 2, color: MainThemeColors.loginFormsBorderColor),
                        ),
                        labelText: 'E-mail',
                        prefixIconColor: MainThemeColors.loginFormsIconsColor,
                        prefixIcon: Icon(Icons.email_outlined),
                        labelStyle: TextStyle(
                            color: MainThemeColors.loginFormsTextsColor, fontWeight: FontWeight.w600),
                      ),
                      validator: (value) {
                        return emailValidation(value);
                      },
                    ),
                  ),
            Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: MainThemeColors.loginFormsBorderColor)),
                          labelText: 'Senha',
                          prefixIconColor: MainThemeColors.loginFormsIconsColor,
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(
                              color: MainThemeColors.loginFormsTextsColor,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
            Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: MainThemeColors.loginFormsBorderColor)),
                          labelText: 'Confirme sua senha',
                          prefixIconColor: MainThemeColors.loginFormsIconsColor,
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(
                              color: MainThemeColors.loginFormsTextsColor,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
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
                          color: MainThemeColors.loginCreateAccountTextColor, fontWeight: FontWeight.bold),
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
