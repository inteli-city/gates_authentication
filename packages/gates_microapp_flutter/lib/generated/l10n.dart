// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Loading information...`
  String get loadingInformation {
    return Intl.message(
      'Loading information...',
      name: 'loadingInformation',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Senha`
  String get password {
    return Intl.message(
      'Senha',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirme a senha`
  String get confirmPassword {
    return Intl.message(
      'Confirme a senha',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Cadastrar`
  String get register {
    return Intl.message(
      'Cadastrar',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Esqueceu sua senha?`
  String get forgotPassword {
    return Intl.message(
      'Esqueceu sua senha?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Access`
  String get access {
    return Intl.message(
      'Access',
      name: 'access',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email you used to create your account so we can send you a code for reseting your password`
  String get resetPasswordPageText {
    return Intl.message(
      'Enter the email you used to create your account so we can send you a code for reseting your password',
      name: 'resetPasswordPageText',
      desc: '',
      args: [],
    );
  }

  /// `Back to login`
  String get backToLogin {
    return Intl.message(
      'Back to login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Verify email`
  String get verifyEmail {
    return Intl.message(
      'Verify email',
      name: 'verifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the code received by email and your new password to reset it`
  String get newPasswordPageText {
    return Intl.message(
      'Fill in the code received by email and your new password to reset it',
      name: 'newPasswordPageText',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm new password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `New password needed`
  String get newPasswordNeeded {
    return Intl.message(
      'New password needed',
      name: 'newPasswordNeeded',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter your new password`
  String get loginNewPasswordText {
    return Intl.message(
      'Please, enter your new password',
      name: 'loginNewPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Sign in as`
  String get buttonLogin {
    return Intl.message(
      'Sign in as',
      name: 'buttonLogin',
      desc: '',
      args: [],
    );
  }

  /// `An error was found in the parameters, following parameters are required: `
  String get textErrorHome {
    return Intl.message(
      'An error was found in the parameters, following parameters are required: ',
      name: 'textErrorHome',
      desc: '',
      args: [],
    );
  }

  /// `{textSubErrorHome} `
  String textSubErrorHome(Object placeholders, Object textSubErrorHome) {
    return Intl.message(
      '$textSubErrorHome ',
      name: 'textSubErrorHome',
      desc: '',
      args: [placeholders, textSubErrorHome],
    );
  }

  /// `ID`
  String get id {
    return Intl.message(
      'ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Role`
  String get role {
    return Intl.message(
      'Role',
      name: 'role',
      desc: '',
      args: [],
    );
  }

  /// `Systems`
  String get systems {
    return Intl.message(
      'Systems',
      name: 'systems',
      desc: '',
      args: [],
    );
  }

  /// `Enabled`
  String get enabled {
    return Intl.message(
      'Enabled',
      name: 'enabled',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `User Management Page`
  String get managementPage {
    return Intl.message(
      'User Management Page',
      name: 'managementPage',
      desc: '',
      args: [],
    );
  }

  /// `Register User`
  String get registerUser {
    return Intl.message(
      'Register User',
      name: 'registerUser',
      desc: '',
      args: [],
    );
  }

  /// `Manage Users`
  String get manageUsers {
    return Intl.message(
      'Manage Users',
      name: 'manageUsers',
      desc: '',
      args: [],
    );
  }

  /// `User created successfully`
  String get createUserSuccess {
    return Intl.message(
      'User created successfully',
      name: 'createUserSuccess',
      desc: '',
      args: [],
    );
  }

  /// `User updated successfully`
  String get updateUserSuccess {
    return Intl.message(
      'User updated successfully',
      name: 'updateUserSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Create User`
  String get createUser {
    return Intl.message(
      'Create User',
      name: 'createUser',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the information of the user to be created:`
  String get createUserText {
    return Intl.message(
      'Fill in the information of the user to be created:',
      name: 'createUserText',
      desc: '',
      args: [],
    );
  }

  /// `Administrator: has full access to system user management.\nUser: only has user authentication access.`
  String get roleTooltip {
    return Intl.message(
      'Administrator: has full access to system user management.\nUser: only has user authentication access.',
      name: 'roleTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Management of Users`
  String get managementUsers {
    return Intl.message(
      'Management of Users',
      name: 'managementUsers',
      desc: '',
      args: [],
    );
  }

  /// `Systems Permissions`
  String get systemsPermissions {
    return Intl.message(
      'Systems Permissions',
      name: 'systemsPermissions',
      desc: '',
      args: [],
    );
  }

  /// `More features coming soon...`
  String get moreFeaturesSoon {
    return Intl.message(
      'More features coming soon...',
      name: 'moreFeaturesSoon',
      desc: '',
      args: [],
    );
  }

  /// `{schema, select, ADMIN_COLLABORATOR{Admin Collaborator} COLLABORATOR{Collaborator} ADMIN_USER{Administrator} USER{User} other{}}`
  String roleSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'ADMIN_COLLABORATOR': 'Admin Collaborator',
        'COLLABORATOR': 'Collaborator',
        'ADMIN_USER': 'Administrator',
        'USER': 'User',
        'other': '',
      },
      name: 'roleSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, UNCONFIRMED{Unconfirmed} CONFIRMED{Confirmed} ARCHIVED{Archived} UNKNOWN{Unknown} RESET_REQUIRED{Reset Required} FORCE_CHANGE_PASSWORD{First Access Required} other{}}`
  String userStatusSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'UNCONFIRMED': 'Unconfirmed',
        'CONFIRMED': 'Confirmed',
        'ARCHIVED': 'Archived',
        'UNKNOWN': 'Unknown',
        'RESET_REQUIRED': 'Reset Required',
        'FORCE_CHANGE_PASSWORD': 'First Access Required',
        'other': '',
      },
      name: 'userStatusSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Update User`
  String get updateUser {
    return Intl.message(
      'Update User',
      name: 'updateUser',
      desc: '',
      args: [],
    );
  }

  /// `Admins can't update other admins`
  String get adminDontUpdateAdmin {
    return Intl.message(
      'Admins can\'t update other admins',
      name: 'adminDontUpdateAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 8 characters, one uppercase letter, one lowercase letter, one number and one special character`
  String get passwordRequirements {
    return Intl.message(
      'Password must contain at least 8 characters, one uppercase letter, one lowercase letter, one number and one special character',
      name: 'passwordRequirements',
      desc: '',
      args: [],
    );
  }

  /// `Required field`
  String get fieldRequired {
    return Intl.message(
      'Required field',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get fieldEmailInvalid {
    return Intl.message(
      'Invalid email',
      name: 'fieldEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get fieldPasswordInvalid {
    return Intl.message(
      'Invalid password',
      name: 'fieldPasswordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get fieldConfirmPasswordInvalid {
    return Intl.message(
      'Passwords do not match',
      name: 'fieldConfirmPasswordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 8 characters`
  String get passwordMinimumLength {
    return Intl.message(
      'Password must contain at least 8 characters',
      name: 'passwordMinimumLength',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get passwordUppercase {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'passwordUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter`
  String get passwordLowercase {
    return Intl.message(
      'Password must contain at least one lowercase letter',
      name: 'passwordLowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get passwordNumber {
    return Intl.message(
      'Password must contain at least one number',
      name: 'passwordNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character (e.g. !@#$%^&*)`
  String get passwordSpecialCharacter {
    return Intl.message(
      'Password must contain at least one special character (e.g. !@#\$%^&*)',
      name: 'passwordSpecialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `{schema, select, invalidStateException{User is already signed in} codeDeliveryFailure{Failed to send code to email, please try again} codeMismatch{Code provided is wrong, please try again} invalidParameter{Some field filled in incorrectly} usernameExists{There is already an account with this email} notAuthorized{Incorrect username or password} userNotConfirmed{Unconfirmed email, confirm it} signedOut{Incorrect email or password} limitExceeded{Too many attempts in a row, try again later} tooManyFailedAttempts{Looks like you tried the code wrong too many times, get in touch} userNotFound{We couldn't find this registered email} internalError{We are experiencing internal issues, please try again later} other{An error occurred, please try again later}}`
  String authErrorsSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'invalidStateException': 'User is already signed in',
        'codeDeliveryFailure': 'Failed to send code to email, please try again',
        'codeMismatch': 'Code provided is wrong, please try again',
        'invalidParameter': 'Some field filled in incorrectly',
        'usernameExists': 'There is already an account with this email',
        'notAuthorized': 'Incorrect username or password',
        'userNotConfirmed': 'Unconfirmed email, confirm it',
        'signedOut': 'Incorrect email or password',
        'limitExceeded': 'Too many attempts in a row, try again later',
        'tooManyFailedAttempts':
            'Looks like you tried the code wrong too many times, get in touch',
        'userNotFound': 'We couldn\'t find this registered email',
        'internalError':
            'We are experiencing internal issues, please try again later',
        'other': 'An error occurred, please try again later',
      },
      name: 'authErrorsSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `Field {entityErrorMessage} is not valid`
  String entityErrorMessage(Object placeholders, Object entityErrorMessage) {
    return Intl.message(
      'Field $entityErrorMessage is not valid',
      name: 'entityErrorMessage',
      desc: '',
      args: [placeholders, entityErrorMessage],
    );
  }

  /// `List is empty, no items found for this request`
  String get emptyListErrorMessage {
    return Intl.message(
      'List is empty, no items found for this request',
      name: 'emptyListErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error sending message, please try again later.`
  String get contactError {
    return Intl.message(
      'Error sending message, please try again later.',
      name: 'contactError',
      desc: '',
      args: [],
    );
  }

  /// `{message}`
  String requestErrorMessage(Object placeholders, Object message) {
    return Intl.message(
      '$message',
      name: 'requestErrorMessage',
      desc: '',
      args: [placeholders, message],
    );
  }

  /// `No items found for {message}`
  String noItemsFoundErrorMessage(Object placeholders, Object message) {
    return Intl.message(
      'No items found for $message',
      name: 'noItemsFoundErrorMessage',
      desc: '',
      args: [placeholders, message],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
