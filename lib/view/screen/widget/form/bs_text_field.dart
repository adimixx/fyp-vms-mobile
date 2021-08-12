import 'package:flutter/material.dart';

class BsTextField extends StatefulWidget {
  const BsTextField(
      {this.borderRadius = 0.0,
      this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.maxLength,
      this.controller,
      this.hasTextObscure = false,
      this.enabled = true});

  final double borderRadius;
  final bool hasTextObscure;

  final TextEditingController? controller;
  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final int? maxLength;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool? enabled;

  @override
  _BsTextFieldState createState() => _BsTextFieldState();
}

class _BsTextFieldState extends State<BsTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      key: widget.fieldKey,
      obscureText: (widget.hasTextObscure) ? _obscureText : false,
      maxLength: widget.maxLength ?? null,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: false,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: new BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: (widget.hasTextObscure)
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              )
            : null,
      ),
    );
  }
}
