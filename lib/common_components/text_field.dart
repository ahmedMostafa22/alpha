import 'package:alpha/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      this.controller,
      this.validator,
      this.onTap,
      this.keyboardType,
      required this.hint,
      this.preIcon,
      this.sufIcon,
      this.secure = false,
      this.enabled = true,
      this.onSufTapped})
      : super(key: key);
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final String? hint;
  final IconData? preIcon, sufIcon;
  final bool secure, enabled;
  final void Function()? onSufTapped;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      onTap: onTap,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: secure,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: onSufTapped,
          child: Icon(
            sufIcon,
            color: Theme.of(context).primaryColor,
          ),
        ),
        contentPadding: const EdgeInsets.all(0),
        hintText: hint,
        prefixIcon: Icon(preIcon),
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
      ),
    );
  }
}
