// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(schema) => "${Intl.select(schema, {
            'invalidStateException': 'User is already signed in',
            'codeDeliveryFailure':
                'Failed to send code to email, please try again',
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
          })}";

  static String m1(placeholders, entityErrorMessage) =>
      "Field ${entityErrorMessage} is not valid";

  static String m2(placeholders, message) => "No items found for ${message}";

  static String m3(placeholders, message) => "${message}";

  static String m4(schema) => "${Intl.select(schema, {
            'ADMIN_COLLABORATOR': 'Admin Collaborator',
            'COLLABORATOR': 'Collaborator',
            'ADMIN_USER': 'Administrator',
            'USER': 'User',
            'other': '',
          })}";

  static String m5(placeholders, textSubErrorHome) => "${textSubErrorHome} ";

  static String m6(schema) => "${Intl.select(schema, {
            'UNCONFIRMED': 'Unconfirmed',
            'CONFIRMED': 'Confirmed',
            'ARCHIVED': 'Archived',
            'UNKNOWN': 'Unknown',
            'RESET_REQUIRED': 'Reset Required',
            'FORCE_CHANGE_PASSWORD': 'First Access Required',
            'other': '',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "access": MessageLookupByLibrary.simpleMessage("Access"),
        "adminDontUpdateAdmin": MessageLookupByLibrary.simpleMessage(
            "Admins can\'t update other admins"),
        "authErrorsSchema": m0,
        "backToLogin": MessageLookupByLibrary.simpleMessage("Back to login"),
        "buttonLogin": MessageLookupByLibrary.simpleMessage("Sign in as"),
        "code": MessageLookupByLibrary.simpleMessage("Code"),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("Confirm new password"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirme a senha"),
        "contactError": MessageLookupByLibrary.simpleMessage(
            "Error sending message, please try again later."),
        "createUser": MessageLookupByLibrary.simpleMessage("Create User"),
        "createUserSuccess":
            MessageLookupByLibrary.simpleMessage("User created successfully"),
        "createUserText": MessageLookupByLibrary.simpleMessage(
            "Fill in the information of the user to be created:"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emptyListErrorMessage": MessageLookupByLibrary.simpleMessage(
            "List is empty, no items found for this request"),
        "enabled": MessageLookupByLibrary.simpleMessage("Enabled"),
        "entityErrorMessage": m1,
        "fieldConfirmPasswordInvalid":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "fieldEmailInvalid":
            MessageLookupByLibrary.simpleMessage("Invalid email"),
        "fieldPasswordInvalid":
            MessageLookupByLibrary.simpleMessage("Invalid password"),
        "fieldRequired": MessageLookupByLibrary.simpleMessage("Required field"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Esqueceu sua senha?"),
        "id": MessageLookupByLibrary.simpleMessage("ID"),
        "loadingInformation":
            MessageLookupByLibrary.simpleMessage("Loading information..."),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginNewPasswordText": MessageLookupByLibrary.simpleMessage(
            "Please, enter your new password"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "manageUsers": MessageLookupByLibrary.simpleMessage("Manage Users"),
        "managementPage":
            MessageLookupByLibrary.simpleMessage("User Management Page"),
        "managementUsers":
            MessageLookupByLibrary.simpleMessage("Management of Users"),
        "moreFeaturesSoon": MessageLookupByLibrary.simpleMessage(
            "More features coming soon..."),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
        "newPasswordNeeded":
            MessageLookupByLibrary.simpleMessage("New password needed"),
        "newPasswordPageText": MessageLookupByLibrary.simpleMessage(
            "Fill in the code received by email and your new password to reset it"),
        "noItemsFoundErrorMessage": m2,
        "password": MessageLookupByLibrary.simpleMessage("Senha"),
        "passwordLowercase": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one lowercase letter"),
        "passwordMinimumLength": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least 8 characters"),
        "passwordNumber": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one number"),
        "passwordRequirements": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least 8 characters, one uppercase letter, one lowercase letter, one number and one special character"),
        "passwordSpecialCharacter": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one special character (e.g. !@#\$%^&*)"),
        "passwordUppercase": MessageLookupByLibrary.simpleMessage(
            "Password must contain at least one uppercase letter"),
        "register": MessageLookupByLibrary.simpleMessage("Cadastrar"),
        "registerUser": MessageLookupByLibrary.simpleMessage("Register User"),
        "requestErrorMessage": m3,
        "resetPasswordPageText": MessageLookupByLibrary.simpleMessage(
            "Enter the email you used to create your account so we can send you a code for reseting your password"),
        "role": MessageLookupByLibrary.simpleMessage("Role"),
        "roleSchema": m4,
        "roleTooltip": MessageLookupByLibrary.simpleMessage(
            "Administrator: has full access to system user management.\nUser: only has user authentication access."),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "systems": MessageLookupByLibrary.simpleMessage("Systems"),
        "systemsPermissions":
            MessageLookupByLibrary.simpleMessage("Systems Permissions"),
        "textErrorHome": MessageLookupByLibrary.simpleMessage(
            "An error was found in the parameters, following parameters are required: "),
        "textSubErrorHome": m5,
        "updateUser": MessageLookupByLibrary.simpleMessage("Update User"),
        "updateUserSuccess":
            MessageLookupByLibrary.simpleMessage("User updated successfully"),
        "userStatusSchema": m6,
        "verifyEmail": MessageLookupByLibrary.simpleMessage("Verify email")
      };
}
