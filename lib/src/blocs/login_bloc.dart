import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:midesarrollo/src/blocs/validators/validators.dart';
import 'package:midesarrollo/src/controllers/login_controller.dart';

class LoginBloc extends FormBloc<String, String> {
  final email = TextFieldBloc();
  final password = TextFieldBloc();

  LoginBloc() {
    addFieldBlocs(fieldBlocs: [email, password]);
    email
      ..addValidators(
          [Validators.requiredField(email), Validators.emailFormat(email)]);
    password..addValidators([Validators.requiredField(password)]);
  }

  @override
  void onSubmitting() async {
    final response = await LoginController.instance.login(
      {
        'username': email.value,
        'password': password.value,
      },
    );

    if (response['status']) {
      emitSuccess(successResponse: response['data']);
    } else {
      emitFailure(failureResponse: response['message']);
    }
  }
}
