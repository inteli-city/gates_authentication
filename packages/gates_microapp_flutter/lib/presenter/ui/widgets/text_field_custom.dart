import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/screen_helper.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';

class TextFielCustom extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final String? Function(String?)? validation;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final bool isPasswordField;
  final bool? showPassword;
  final TextEditingController? controller;
  final Function()? changePwdVisibility;
  final Function(String)? onFieldSubmitted;
  const TextFielCustom({
    super.key,
    required this.hintText,
    this.validation,
    this.inputFormatters,
    this.onChanged,
    this.prefixIcon,
    this.isPasswordField = false,
    this.showPassword,
    this.changePwdVisibility,
    this.controller,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      textAlign: TextAlign.start,
      validator: validation,
      onChanged: onChanged,
      controller: controller,
      cursorColor: AppColors.primaryBlue,
      obscureText: showPassword != null ? !showPassword! : false,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          hintText: hintText,
          suffixIconColor: AppColors.primaryBlue,
          filled: true,
          semanticCounterText: '123',
          prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
          prefixIconColor: AppColors.primaryBlue,
          suffixIcon: isPasswordField
              ? InkWell(
                  onTap: () => changePwdVisibility!(),
                  child: Icon(
                    showPassword! ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                  ),
                )
              : null,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 2)),
          errorStyle: TextStyle(
            color: AppColors.red,
            fontSize:
                ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                    ? 14
                    : 16,
            height: 1,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.gray, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryBlue, width: 2))),
    );
  }
}
