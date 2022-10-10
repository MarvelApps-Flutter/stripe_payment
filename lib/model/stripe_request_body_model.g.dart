// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StripeBodyRequestModel _$StripeBodyRequestModelFromJson(
        Map<String, dynamic> json) =>
    StripeBodyRequestModel(
      amount: json['amount'] as String?,
      currency: json['currency'] as String?,
      paymentMethodTypes: json['payment_method_types[]'] as String?,
    );

Map<String, dynamic> _$StripeBodyRequestModelToJson(
        StripeBodyRequestModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'payment_method_types[]': instance.paymentMethodTypes,
    };
