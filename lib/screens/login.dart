import 'package:flutter/material.dart';
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
                ],
              )),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccount()));
                    },
                    child: const Text(
                      'Crie sua conta!',
                      style: TextStyle(
                          color: MainThemeColors.loginCreateAccountTextColor, fontWeight: FontWeight.bold),
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
