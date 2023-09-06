import 'package:flutter/material.dart';
import '../../helpers/regex_validation.dart';

class TextFormLogin extends StatefulWidget {
  const TextFormLogin(
      {super.key,
      required this.labelText,
      required this.isPassword,
      required this.formIcon,
      required this.iconColor,
      required this.borderColor,
      required this.textColor,
      required this.controller,
      this.assistController,
      });

    final String labelText;
    final bool isPassword;
    final IconData formIcon;
    final Color iconColor;
    final Color borderColor;
    final Color textColor;
    final TextEditingController controller;
    //Caso form seja de confirmar senha, passa o controller do campo senha1 para comparar com o campo senha2
    final TextEditingController? assistController;

  @override
  State<TextFormLogin> createState() => _TextFormLoginState();
}

class _TextFormLoginState extends State<TextFormLogin> {

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    //operador ternario, se for campo de texto pra senha obscuretext é true e o botao de sufixo do olho para visualização é ativado
    return widget.isPassword ?
    Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      child: TextFormField(
        controller: widget.controller,
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: widget.borderColor),
          ),
          labelText: widget.labelText,
          prefixIconColor: widget.iconColor,
          suffixIconColor: widget.iconColor,
          prefixIcon: Icon(widget.formIcon),
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
               _passwordVisible
               ? Icons.visibility
               : Icons.visibility_off,
               ),
            onPressed: () {
               // Update the state i.e. toogle the state of passwordVisible variable
               setState(() {
                   _passwordVisible = !_passwordVisible;
               });
             },
            ),
          labelStyle: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.w600),
        ),
        validator: (value) {
          if (widget.assistController != null && widget.assistController?.text != widget.controller.text) {
            return "Senhas não conferem";
          }
          return null;
        },
      ),
    )
    : //se for para email, retira o obscure text e adiciona o validador de email
    Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      child: TextFormField(
        controller: widget.controller,
        obscureText: false,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: widget.borderColor),
          ),
          labelText: widget.labelText,
          prefixIconColor: widget.iconColor,
          prefixIcon: Icon(widget.formIcon),
          labelStyle: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.w600),
        ),
        validator: (value) {
          return emailValidation(value);
        },
      ),
    );
  }
}
