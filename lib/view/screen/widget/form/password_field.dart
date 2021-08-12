import 'package:flutter/material.dart';
import 'package:vms/view/screen/widget/form/bs_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.maxLength,
      this.controller});

  final TextEditingController? controller;
  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final int? maxLength;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // BsTextField(borderRadius: 30, controller: widget.controller,  ,)

    // return TextFormField(
    //   controller: widget.controller,
    //   key: widget.fieldKey,
    //   obscureText: _obscureText,
    //   maxLength: widget.maxLength ?? null,
    //   onSaved: widget.onSaved,
    //   validator: widget.validator,
    //   onFieldSubmitted: widget.onFieldSubmitted,
    //   decoration: InputDecoration(
    //     border: const UnderlineInputBorder(),
    //     filled: true,

    //     ),
    //   ),
    // );

    return Scaffold();
  }
}
