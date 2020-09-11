import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:midesarrollo/src/blocs/validators/validators.dart';
import 'package:midesarrollo/src/controllers/login_controller.dart';

class LoginBloc extends FormBloc<String, String> {
  final username = TextFieldBloc();
  final password = TextFieldBloc();

  LoginBloc() {
    addFieldBlocs(fieldBlocs: [username, password]);
    username
      ..addValidators(
          [Validators.requiredField(username), Validators.numeroCelular(username)]);
    password..addValidators([Validators.requiredField(password)]);
  }

  @override
  void onSubmitting() async {
    final response = await LoginController.instance.login(
      {
        'username': username.value.replaceAll(' ', ''),
        'password': password.value,
      },
    );

    response['status']
        ? emitSuccess(successResponse: response['data'])
        : emitFailure(failureResponse: response['message']);
  }
}
