import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    this.controller,
    this.isSecure = false,
    required this.hintText,
    required this.labelText,
    this.onChanged,
    this.suffixText,
    this.onSuffixTap,
    this.keyboardType,
  });

  final String? suffixText;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isSecure;
  final void Function(String)? onChanged;
  final VoidCallback? onSuffixTap;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obSecureText;

  @override
  void initState() {
    super.initState();
    _obSecureText = widget.isSecure;
  }

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color(0xff93714A);

    return TextFormField(
      onChanged: widget.onChanged,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _obSecureText,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle:  TextStyle(
          fontWeight: FontWeight.w500,
          color: mainColor,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color(0xff535353)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 2, color: mainColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: mainColor),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 2, color: mainColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 2, color: Colors.red),
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.isSecure)
              IconButton(
                icon: Icon(
                  _obSecureText ? Icons.visibility_off : Icons.visibility,
                  color: mainColor,
                ),
                onPressed: () {
                  setState(() {
                    _obSecureText = !_obSecureText;
                  });
                },
              ),
            if (widget.suffixText != null)
              GestureDetector(
                onTap: widget.onSuffixTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.suffixText!,
                    style: const TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
