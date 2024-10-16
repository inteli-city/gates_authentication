// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static String m0(schema) => "${Intl.select(schema, {
            'invalidStateException':
                'Parece que a operação solicitada não é válida no momento. Por favor, tente novamente mais tarde.',
            'codeDeliveryFailure':
                'Falha ao enviar código para o e-mail, tente novamente',
            'codeMismatch': 'Código fornecido está errado, tente novamente',
            'invalidParameter':
                'Parece que um dos campos foi preenchido de forma incorreta. Por favor, verifique e tente novamente.',
            'usernameExists': 'Já existe um cadastro com este e-mail',
            'notAuthorized':
                'Você não tem autorização para realizar esta operação.',
            'incorrectPassword': 'Usuário ou senha incorretos',
            'userNotConfirmed':
                'Usuário não confirmado, contate um administrador',
            'signedOut':
                'Não é possível realizar a operação solicitada porque você está desconectado. Por favor, faça login e tente novamente.',
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde',
            'tooManyFailedAttempts':
                'Você fez muitas tentativas falhas para esta ação. Por favor, aguarde um momento e tente novamente mais tarde.',
            'userNotFound': 'Não encontramos este e-mail cadastrado',
            'internalError': 'Estamos com problemas internos, tente mais tarde',
            'invalidPasswordException':
                'A senha deve ter pelo menos 8 caracteres, incluindo 1 número, 1 letra maiúscula, 1 letra minúscula e 1 caractere especial.',
            'other': 'Ocorreu algum erro desconhecido',
          })}";

  static String m1(placeholders, localStorageErrorMessage) =>
      "Armazenamento local não disponível: ${localStorageErrorMessage}";

  static String m2(schema) => "${Intl.select(schema, {
            'ADMIN_COLLABORATOR': 'Colaborador administrador',
            'COLLABORATOR': 'Colaborador',
            'ADMIN_USER': 'Administrador',
            'USER': 'Usuário',
            'other': '',
          })}";

  static String m3(placeholders, textSubErrorHome) => "${textSubErrorHome}";

  static String m4(schema) => "${Intl.select(schema, {
            'UNCONFIRMED': 'Não confirmado',
            'CONFIRMED': 'Confirmado',
            'ARCHIVED': 'Arquivado',
            'UNKNOWN': 'Desconhecido',
            'RESET_REQUIRED': 'Redefinir necessário',
            'FORCE_CHANGE_PASSWORD': 'Primeiro acesso pendente',
            'other': '',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "access": MessageLookupByLibrary.simpleMessage("Acessar"),
        "adminDontUpdateAdmin": MessageLookupByLibrary.simpleMessage(
            "Não é possível editar outro administrador"),
        "attention": MessageLookupByLibrary.simpleMessage("Atenção"),
        "authErrorsSchema": m0,
        "backToLogin":
            MessageLookupByLibrary.simpleMessage("Voltar para o login"),
        "buttonLogin": MessageLookupByLibrary.simpleMessage("Entrar como"),
        "code": MessageLookupByLibrary.simpleMessage("Código"),
        "codeDisclaimer": MessageLookupByLibrary.simpleMessage(
            "Caso não receba o e-mail com o código de verificação, por favor, verifique se digitou o e-mail corretamente. Se o problema persistir, entre em contato com um administrador para confirmar se você está devidamente cadastrado."),
        "confirmNewPassword":
            MessageLookupByLibrary.simpleMessage("Confirme a nova senha"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirme a senha"),
        "createUser": MessageLookupByLibrary.simpleMessage("Criar Usuário"),
        "createUserSuccess":
            MessageLookupByLibrary.simpleMessage("Usuário criado com sucesso"),
        "createUserText": MessageLookupByLibrary.simpleMessage(
            "Preencha as informações do usuário a ser criado:"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "enabled": MessageLookupByLibrary.simpleMessage("Habilitado"),
        "fieldConfirmPasswordInvalid":
            MessageLookupByLibrary.simpleMessage("As senhas não conferem"),
        "fieldEmailInvalid":
            MessageLookupByLibrary.simpleMessage("Email inválido"),
        "fieldPasswordInvalid":
            MessageLookupByLibrary.simpleMessage("Senha inválida"),
        "fieldRequired":
            MessageLookupByLibrary.simpleMessage("Campo é obrigatório"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Esqueceu sua senha?"),
        "id": MessageLookupByLibrary.simpleMessage("ID"),
        "inQueueNoInternetConnectionErrorMessage":
            MessageLookupByLibrary.simpleMessage(
                "Sem conexão porém a cada 5 minutos tentaremos enviar novamente"),
        "loadingInformation":
            MessageLookupByLibrary.simpleMessage("Carregando informações..."),
        "localStorageErrorMessage": m1,
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginNewPasswordText": MessageLookupByLibrary.simpleMessage(
            "Por favor, informe sua nova senha"),
        "logout": MessageLookupByLibrary.simpleMessage("Sair"),
        "logoutError":
            MessageLookupByLibrary.simpleMessage("Erro ao sair da aplicação"),
        "manageUsers":
            MessageLookupByLibrary.simpleMessage("Gerenciar Usuários"),
        "managementPage": MessageLookupByLibrary.simpleMessage(
            "Página de Gestão de Usuários"),
        "managementUsers":
            MessageLookupByLibrary.simpleMessage("Gerenciamento de Usuários"),
        "moreFeaturesSoon":
            MessageLookupByLibrary.simpleMessage("Mais recursos em breve..."),
        "name": MessageLookupByLibrary.simpleMessage("Nome"),
        "newPassword": MessageLookupByLibrary.simpleMessage("Nova senha"),
        "newPasswordNecessaryError":
            MessageLookupByLibrary.simpleMessage("Nova senha é necessária"),
        "newPasswordNeeded":
            MessageLookupByLibrary.simpleMessage("Nova senha necessária"),
        "newPasswordPageText": MessageLookupByLibrary.simpleMessage(
            "Preencha o código recebido por e-mail e sua nova senha para redefini-la"),
        "noDataFoundError":
            MessageLookupByLibrary.simpleMessage("Nenhum dado encontrado"),
        "noInternetConnectionErrorMessage":
            MessageLookupByLibrary.simpleMessage("Sem conexão com a internet"),
        "password": MessageLookupByLibrary.simpleMessage("Senha"),
        "passwordLowercase": MessageLookupByLibrary.simpleMessage(
            "A senha deve conter pelo menos uma letra minúscula"),
        "passwordMinimumLength": MessageLookupByLibrary.simpleMessage(
            "A senha deve conter no mínimo 8 caracteres"),
        "passwordNumber": MessageLookupByLibrary.simpleMessage(
            "A senha deve conter pelo menos um número"),
        "passwordRequirements": MessageLookupByLibrary.simpleMessage(
            "A senha deve conter no mínimo 8 caracteres, com pelo menos uma letra maiúscula, uma letra minúscula, um número e um caractere especial"),
        "passwordSpecialCharacter": MessageLookupByLibrary.simpleMessage(
            "A senha deve conter pelo menos um caractere especial (ex: !@#\$%^&*)"),
        "passwordUppercase": MessageLookupByLibrary.simpleMessage(
            "A senha deve conter pelo menos uma letra maiúscula"),
        "register": MessageLookupByLibrary.simpleMessage("Cadastrar"),
        "registerUser":
            MessageLookupByLibrary.simpleMessage("Registrar Usuário"),
        "resetPasswordPageText": MessageLookupByLibrary.simpleMessage(
            "Digite o e-mail que você usou para criar sua conta para que possamos enviar um código para redefinir sua senha"),
        "role": MessageLookupByLibrary.simpleMessage("Função"),
        "roleSchema": m2,
        "roleTooltip": MessageLookupByLibrary.simpleMessage(
            "Administrador: possui acesso total a gestão de usuários do sistema.\nUser: possui acesso apenas de autenticação de usuário."),
        "send": MessageLookupByLibrary.simpleMessage("Enviar"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "systems": MessageLookupByLibrary.simpleMessage("Sistemas"),
        "systemsPermissions":
            MessageLookupByLibrary.simpleMessage("Permissões de Sistema"),
        "textErrorHome": MessageLookupByLibrary.simpleMessage(
            "Foi encontrado um erro nos parâmetros, seguintes parâmetros são necessários: "),
        "textSubErrorHome": m3,
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "Erro desconhecido, por favor, tente novamente"),
        "updateUser": MessageLookupByLibrary.simpleMessage("Atualizar usuário"),
        "updateUserSuccess": MessageLookupByLibrary.simpleMessage(
            "Usuário atualizado com sucesso"),
        "userStatusSchema": m4,
        "verifyEmail":
            MessageLookupByLibrary.simpleMessage("Verifique seu e-mail")
      };
}
