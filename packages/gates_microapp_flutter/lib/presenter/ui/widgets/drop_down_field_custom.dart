import 'package:flutter/material.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/screen_helper.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';

class DropDownFieldWidget<T> extends StatelessWidget {
  final String hintText;
  final void Function(T? value)? onChanged;
  final String? Function(T?)? validation;
  final Widget? prefixIcon;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  const DropDownFieldWidget({
    super.key,
    required this.hintText,
    this.value,
    this.onChanged,
    this.prefixIcon,
    required this.items,
    this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      items: items,
      validator: validation,
      dropdownColor: AppColors.white,
      hint: Text(hintText),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.primaryBlue,
          fillColor: AppColors.white,
          suffixIconColor: AppColors.primaryBlue,
          filled: true,
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
