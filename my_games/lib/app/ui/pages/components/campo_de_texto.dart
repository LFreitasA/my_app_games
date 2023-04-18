import 'package:flutter/material.dart';

class CampoDeTexto extends StatefulWidget {
  const CampoDeTexto({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.icone,
    required this.obscureText,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Icon? icone;
  final bool obscureText;

  @override
  State<CampoDeTexto> createState() => _CampoDeTextoState();
}

class _CampoDeTextoState extends State<CampoDeTexto> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText ? showPass : false,
      decoration: InputDecoration(
          icon: widget.icone,
          hintText: widget.hintText,
          labelText: widget.labelText,
          suffix: widget.obscureText
              ? GestureDetector(
                  child: Icon(
                      showPass ? Icons.remove_red_eye : Icons.visibility_off),
                  onTap: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                )
              : null),
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}
