import 'package:midesarrollo/app/src/views/conekta/payment/components/payment_form.dart';
import 'package:midesarrollo/app/src/widgets/Appbars/app_bar_default.dart';
import 'package:flutter/material.dart';
class PaymentView extends StatelessWidget {
  static final String routeName = '/payment';

  const PaymentView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Pago con tarjeta"),
      ),
      body: PaymentForm(),
    );
  }
}