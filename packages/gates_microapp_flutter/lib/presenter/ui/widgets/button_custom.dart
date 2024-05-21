import 'package:flutter/material.dart';
import 'package:gates_microapp_flutter/helpers/utils/screen_helper.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';
import 'package:gates_microapp_flutter/shared/themes/app_text_styles.dart';

class ButtonCustom extends StatelessWidget {
  final Function() onPressed;
  final bool isLoading;
  final String text;
  final IconData? icon;
  final bool isOutlined;
  const ButtonCustom({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.isLoading = false,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 50,
        minWidth: double.infinity,
      ),
      child: ElevatedButton(
        style: isOutlined
            ? ElevatedButton.styleFrom(
                foregroundColor: AppColors.primaryBlue,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                padding: const EdgeInsets.all(16),
                shape: StadiumBorder(
                  side: BorderSide(color: AppColors.primaryBlue, width: 3),
                ),
              )
            : ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                padding: const EdgeInsets.all(16),
              ),
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(
                color: isOutlined ? AppColors.primaryBlue : AppColors.white)
            : icon == null
                ? Text(
                    text,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headline2.copyWith(
                      color:
                          isOutlined ? AppColors.primaryBlue : AppColors.white,
                      fontSize: ScreenHelper.width(context) <
                              ScreenHelper.breakpointMobile
                          ? 18
                          : 20,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: isOutlined
                            ? AppColors.primaryBlue
                            : AppColors.white,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headline2.copyWith(
                          color: isOutlined
                              ? AppColors.primaryBlue
                              : AppColors.white,
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
