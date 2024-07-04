import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:gates_microapp_flutter/domain/entities/user_info.dart';
import 'package:gates_microapp_flutter/domain/enum/role_enum.dart';
import 'package:gates_microapp_flutter/generated/l10n.dart';
import 'package:gates_microapp_flutter/shared/helpers/functions/global_snackbar.dart';
import 'package:gates_microapp_flutter/shared/helpers/utils/screen_helper.dart';
import 'package:gates_microapp_flutter/presenter/controllers/admin/management_users_controller.dart';
import 'package:gates_microapp_flutter/presenter/states/management_group_state.dart';
import 'package:gates_microapp_flutter/presenter/ui/dialogs/update_user_dialog.dart';
import 'package:gates_microapp_flutter/presenter/ui/pages/landing_page.dart';
import 'package:gates_microapp_flutter/shared/themes/app_colors.dart';
import 'package:gates_microapp_flutter/shared/themes/app_text_styles.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ManagementUsersPage extends StatefulWidget {
  const ManagementUsersPage({super.key});

  @override
  State<ManagementUsersPage> createState() => _ManagementUsersPageState();
}

class _ManagementUsersPageState extends State<ManagementUsersPage> {
  ManagementUsersController controller = Modular.get();
  final DataGridController _dataGridController = DataGridController();
  final int _rowsPerPage = 20;
  final double _dataPagerHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return LandingPage(
      isBackButtonVisible: true,
      maxWidth: ScreenHelper.width(context) * 0.9,
      child: Observer(builder: (_) {
        var state = controller.state;
        return state is ManagementUsersErrorState
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).managementUsers,
                    style: AppTextStyles.headline1,
                  ),
                  const SizedBox(height: 16),
                  Text('Erro ao carregar dados: ${state.error.errorMessage}')
                ],
              )
            : state is ManagementUsersSuccessState
                ? LayoutBuilder(builder: (context, constraints) {
                    var obraTableDataSource = ObraDataSourceTable(
                        users: state.users, context: context);
                    return Column(
                      children: [
                        Text(
                          S.of(context).managementUsers,
                          style: AppTextStyles.headline1,
                        ),
                        const SizedBox(height: 16),
                        SfDataGrid(
                          isScrollbarAlwaysShown: true,
                          controller: _dataGridController,
                          allowSorting: true,
                          allowMultiColumnSorting: true,
                          columnWidthMode: ColumnWidthMode.fill,
                          rowHeight: 80,
                          // selectionMode: SelectionMode.multiple,
                          source: obraTableDataSource,
                          columns: [
                            _getColumn('userId', S.of(context).id),
                            _getColumn('role', S.of(context).role),
                            _getColumn('email', S.of(context).email),
                            _getColumn('name', S.of(context).name),
                            _getColumn('groups', S.of(context).systems),
                            _getColumn('enabled', S.of(context).enabled),
                            _getColumn('status', S.of(context).status),
                            _getColumn('edit', null),
                          ],
                        ),
                        state.users.length <= _rowsPerPage
                            ? const SizedBox.shrink()
                            : SizedBox(
                                height: _dataPagerHeight,
                                child: SfDataPagerTheme(
                                  data: SfDataPagerThemeData(
                                    selectedItemColor: AppColors.primaryBlue,
                                    backgroundColor: Colors.white,
                                  ),
                                  child: SfDataPager(
                                    delegate: obraTableDataSource,
                                    pageCount:
                                        state.users.length / _rowsPerPage,
                                    direction: Axis.horizontal,
                                  ),
                                ),
                              ),
                      ],
                    );
                  })
                : const Center(child: CircularProgressIndicator());
      }),
    );
  }

  GridColumn _getColumn(String columnName, String? label) {
    return GridColumn(
      maximumWidth: ScreenHelper.width(context) * 0.2,
      columnName: columnName,
      label: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.centerLeft,
        child: label == null
            ? null
            : Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.headline3,
              ),
      ),
    );
  }
}

class ObraDataSourceTable extends DataGridSource {
  ObraDataSourceTable(
      {required List<UserInfo> users, required BuildContext context}) {
    _users = users
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                columnName: 'userId',
                value: e.userId,
              ),
              DataGridCell<String>(columnName: 'role', value: e.role.typeName),
              DataGridCell<String>(columnName: 'email', value: e.email),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'groups',
                  value: e.groups
                      .map((e) => e.toString().split('.')[1])
                      .join(', ')),
              DataGridCell<String>(
                  columnName: 'enabled', value: e.enabled ? 'Sim' : 'Não'),
              DataGridCell<String>(
                  columnName: 'status', value: e.status.typeName()),
              DataGridCell<UserInfo>(
                columnName: 'edit',
                value: e,
              ),
            ]))
        .toList();
  }

  List<DataGridRow> _users = [];

  @override
  List<DataGridRow> get rows => _users.isEmpty ? [] : _users;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    AuthController authController = Modular.get();
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: dataGridCell.columnName == 'edit'
            ? LayoutBuilder(builder: (context, BoxConstraints constraints) {
                return IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      final selectedUserRole =
                          (dataGridCell.value as UserInfo).role;
                      final authenticatedUserRole = authController.user!.role;

                      final isUserAdmin =
                          authenticatedUserRole == RoleEnum.ADMIN_USER;

                      final isUserRoleAdminOrIntellicity =
                          selectedUserRole == RoleEnum.ADMIN_USER ||
                              selectedUserRole == RoleEnum.COLLABORATOR;

                      if (isUserRoleAdminOrIntellicity && isUserAdmin) {
                        GlobalSnackBar.error(S.current.adminDontUpdateAdmin);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => UpdateUserDialog(
                            user: dataGridCell.value,
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.primaryBlue,
                      size: 24,
                    ));
              })
            : Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}
