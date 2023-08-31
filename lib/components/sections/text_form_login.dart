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
      required this.textColor});

    final String labelText;
    final bool isPassword;
    final IconData formIcon;
    final Color iconColor;
    final Color borderColor;
    final Color textColor;

  @override
  State<TextFormLogin> createState() => _TextFormLoginState();
}

class _TextFormLoginState extends State<TextFormLogin> {

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return widget.isPassword ?//operador ternario, se for campo de texto pra senha obscuretext é true e o botao de sufixo do olho para visualização é ativado
    Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      child: TextFormField(
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
        
      ),
    )
    : //se for para email, retira o obscure text e adiciona o validador de email
    Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      child: TextFormField(
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
