import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/domain/entities/user_info.dart';
import 'package:gates_microapp_flutter/domain/enum/group_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/screen_helper.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/validation_field.dart';
import 'package:gates_microapp_flutter/infra/models/group_model.dart';
import 'package:gates_microapp_flutter/presenter/controllers/admin/management_users_controller.dart';
import 'package:gates_microapp_flutter/presenter/controllers/admin/update_user_controller.dart';
import 'package:gates_microapp_flutter/presenter/states/basic_state.dart';
import 'package:gates_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:gates_microapp_flutter/presenter/ui/widgets/drop_down_field_custom.dart';
import 'package:gates_microapp_flutter/presenter/ui/widgets/text_field_custom.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';
import 'package:gates_microapp_flutter/shared/themes/app_text_styles.dart';

class UpdateUserDialog extends StatefulWidget {
  final UserInfo user;
  const UpdateUserDialog({super.key, required this.user});

  @override
  State<UpdateUserDialog> createState() => _UpdateUserDialogState();
}

class _UpdateUserDialogState extends State<UpdateUserDialog> {
  AuthController authController = Modular.get();
  UpdateUserController controller = Modular.get();
  ManagementUsersController managementGroupController = Modular.get();
  var groups = <GroupModel>[];
  final nameController = TextEditingController();
  RoleEnum? role;
  late bool enabled;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name;
    enabled = widget.user.enabled;
    setState(() {
      for (GroupEnum item in GroupEnum.values) {
        groups.add(GroupModel(
            groupName: item, isSelected: widget.user.groups.contains(item)));
      }
      role = widget.user.role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: SizedBox(
        width: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
            ? ScreenHelper.width(context) * 0.8
            : ScreenHelper.width(context) * 0.5,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${S.of(context).updateUser}: ${widget.user.email}',
                  style: AppTextStyles.headline1,
                ),
                const SizedBox(height: 24),
                TextFielCustom(
                  hintText: S.of(context).name,
                  controller: nameController,
                  prefixIcon: Icons.person,
                  validation: ValidationFieldHelper.validateRequiredField,
                ),
                const SizedBox(height: 8),
                DropDownFieldWidget<RoleEnum>(
                  hintText: S.of(context).role,
                  value: role,
                  prefixIcon: const Icon(Icons.work),
                  onChanged: (value) {
                    role = value;
                  },
                  validation: ValidationFieldHelper.validateRole,
                  items: RoleEnum.values.map((RoleEnum value) {
                    return DropdownMenuItem<RoleEnum>(
                      value: value,
                      child: Text(value.typeName),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primaryBlue, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: enabled,
                          activeColor: AppColors.primaryBlue,
                          onChanged: (value) {
                            setState(() {
                              enabled = value!;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Ativo',
                          style: AppTextStyles.bodyText1,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${S.of(context).systemsPermissions}:',
                    style: AppTextStyles.bodyText1,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(groups[index].groupName.name),
                      value: groups[index].isSelected,
                      activeColor: AppColors.primaryBlue,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        setState(() {
                          groups[index].isSelected = value!;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                Observer(builder: (_) {
                  return ButtonCustom(
                    text: S.of(context).updateUser,
                    isLoading: controller.state is BasicLoadingState,
                    onPressed: controller.state is BasicLoadingState
                        ? () {}
                        : () async {
                            if (formKey.currentState!.validate()) {
                              await controller.updateUser(
                                widget.user.email,
                                nameController.text,
                                role!,
                                groups
                                    .where((element) => element.isSelected)
                                    .map((e) => e.groupName.name)
                                    .toList(),
                                enabled,
                              );
                            }
                            if (controller.state is BasicInitialState) {
                              Modular.to.pop();
                              managementGroupController.getAllUsers();
                            }
                          },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
