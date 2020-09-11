import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:midesarrollo/src/blocs/validators/validators.dart';
import 'package:midesarrollo/src/controllers/user_controller.dart';

class ContrasenaBloc extends FormBloc<String, String> {
  final password = TextFieldBloc();
  final confirm = TextFieldBloc();

  ContrasenaBloc() {
    addFieldBlocs(fieldBlocs: [password, confirm]);
    password..addValidators([Validators.requiredField(password)]);
    confirm
      ..addValidators([
        Validators.requiredField(confirm),
        Validators.confirmPassword(password)
      ])
      ..subscribeToFieldBlocs([password]);
  }

  @override
  void onSubmitting() async {
    final response =
        await UserController.instance.changePassword(password.value);
    response['status']
        ? emitSuccess(successResponse: response['message'])
        : emitFailure(failureResponse: response['message']);
  }
}
