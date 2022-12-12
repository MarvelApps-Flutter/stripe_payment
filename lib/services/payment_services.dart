import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import '../constant/service_constant.dart';
import '../constant/string_constant.dart';
import '../mixin/common_function_mixin.dart';
import '../model/stripe_payment_response_model.dart';
import '../model/stripe_request_body_model.dart';

class PaymentService with CommonFunctions {
  StripePaymentResponseModel? _paymentIntentData;

  createPayment(String amount, String currency) async {
    StripeBodyRequestModel body = StripeBodyRequestModel(
        amount: amount,
        currency: currency,
        paymentMethodTypes: StringConstant.card);

    log(body.toString());
    var response = await http.post(Uri.parse(ServiceConstants.stripeBaseUrl),
        body: body.toJson(),
        headers: {
          StringConstant.authorization:
              '${StringConstant.bearer} ${ServiceConstants.stripeSecret}',
          StringConstant.contentType: StringConstant.formUrlencodedContentType
        });
    log('Create Intent reponse ===> ${response.body.toString()}');
    return jsonDecode(response.body);
  }

  Future<String> makePayment(
      {required BuildContext context,
      required int amount,
      required Function(String? transactionId) asyncGapCheck,
      String? currency}) async {
    try {
      await createPayment((amount * 100).toString(), currency ?? "INR")
          .then((value) {
        _paymentIntentData =
            value != false ? StripePaymentResponseModel.fromJson(value) : null;
      });
      if (_paymentIntentData?.clientSecret == null) {
        showToast(_paymentIntentData?.error?.message ?? "");
        return _paymentIntentData?.id ?? null.toString();
      }
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: _paymentIntentData?.clientSecret,
              style: ThemeMode.dark,
              merchantDisplayName: 'ubi'));

      await Stripe.instance.presentPaymentSheet();

      log("after payment sheet presented");

      asyncGapCheck(_paymentIntentData?.id);

      showToast1('Payment succesfully completed');

      log(_paymentIntentData?.id ?? "");

      return _paymentIntentData?.id ?? null.toString();
    } on Exception catch (e) {
      if (e is StripeException) {
        showToast('Error from Stripe: ${e.error.localizedMessage}');

        return null.toString();
      } else {
        showToast('Unforeseen error: $e');

        return null.toString();
      }
    }
  }
}
