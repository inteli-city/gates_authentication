import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/domain/enum/group_enum.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/validation_field.dart';
import 'package:gates_microapp_flutter/infra/models/group_model.dart';
import 'package:gates_microapp_flutter/presenter/controllers/admin/create_user_controller.dart';
import 'package:gates_microapp_flutter/presenter/states/basic_state.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:gates_microapp_flutter/presenter/ui/widgets/button_custom.dart';
import 'package:gates_microapp_flutter/presenter/ui/widgets/drop_down_field_custom.dart';
import 'package:gates_microapp_flutter/presenter/ui/widgets/text_field_custom.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';
import 'package:gates_microapp_flutter/shared/themes/app_text_styles.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final AuthController authController = Modular.get();
  var groups = <GroupModel>[];
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  RoleEnum? role;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    for (GroupEnum item in authController.user!.groups) {
      groups.add(GroupModel(groupName: item, isSelected: false));
    }
  }

  @override
  Widget build(BuildContext context) {
    final CreateUserController controller = Modular.get();
    List<RoleEnum> items = authController.user!.role == RoleEnum.ADMIN_USER
        ? [RoleEnum.ADMIN_USER, RoleEnum.USER]
        : RoleEnum.values.toList();

    return LandingPage(
      isBackButtonVisible: true,
      child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                S.of(context).createUser,
                style: AppTextStyles.headline1,
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).createUserText,
                style: AppTextStyles.bodyText1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextFielCustom(
                hintText: S.of(context).name,
                controller: nameController,
                prefixIcon: Icons.person,
                validation: ValidationFieldHelper.validateRequiredField,
              ),
              const SizedBox(height: 16),
              TextFielCustom(
                hintText: S.of(context).email,
                controller: emailController,
                prefixIcon: Icons.email,
                validation: ValidationFieldHelper.validateRequiredField,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Flexible(
                    child: DropDownFieldWidget<RoleEnum>(
                      hintText: S.of(context).role,
                      prefixIcon: const Icon(Icons.work),
                      onChanged: (value) {
                        role = value;
                      },
                      validation: ValidationFieldHelper.validateRole,
                      items: items.map((RoleEnum value) {
                        return DropdownMenuItem<RoleEnum>(
                          value: value,
                          child: Text(value.typeName),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Tooltip(
                    message: S.of(context).roleTooltip,
                    child: Icon(
                      Icons.help,
                      color: AppColors.primaryBlue,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Permissão de Sistemas:',
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
                  text: S.of(context).register,
                  isLoading: controller.state is BasicLoadingState,
                  onPressed: controller.state is BasicLoadingState
                      ? () {}
                      : () async {
                          if (formKey.currentState!.validate()) {
                            await controller.createUser(
                                emailController.text,
                                nameController.text,
                                role!,
                                groups
                                    .where((element) => element.isSelected)
                                    .map((e) => e.groupName.name)
                                    .toList());
                          }
                          if (controller.state is BasicInitialState) {
                            setState(() {
                              formKey.currentState!.reset();
                              emailController.clear();
                              nameController.clear();
                              role = null;
                              groups = [];
                              for (GroupEnum item
                                  in authController.user!.groups) {
                                groups.add(GroupModel(
                                    groupName: item, isSelected: false));
                              }
                            });
                          }
                        },
                );
              }),
            ],
          )),
    );
  }
}
