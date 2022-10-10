// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StripePaymentResponseModel _$StripePaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    StripePaymentResponseModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      amount: json['amount'] as int?,
      amountCapturable: json['amount_capturable'] as int?,
      amountReceived: json['amount_received'] as int?,
      captureMethod: json['capture_method'] as String?,
      charges: json['charges'] == null
          ? null
          : Charges.fromJson(json['charges'] as Map<String, dynamic>),
      clientSecret: json['client_secret'] as String?,
      confirmationMethod: json['confirmation_method'] as String?,
      created: json['created'] as int?,
      currency: json['currency'] as String?,
      livemode: json['livemode'] as bool?,
      paymentMethodOptions: json['payment_method_options'] == null
          ? null
          : PaymentMethodOptions.fromJson(
              json['payment_method_options'] as Map<String, dynamic>),
      paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$StripePaymentResponseModelToJson(
        StripePaymentResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'amount': instance.amount,
      'amount_capturable': instance.amountCapturable,
      'amount_received': instance.amountReceived,
      'capture_method': instance.captureMethod,
      'charges': instance.charges,
      'client_secret': instance.clientSecret,
      'confirmation_method': instance.confirmationMethod,
      'created': instance.created,
      'currency': instance.currency,
      'livemode': instance.livemode,
      'payment_method_options': instance.paymentMethodOptions,
      'payment_method_types': instance.paymentMethodTypes,
      'status': instance.status,
    };

Charges _$ChargesFromJson(Map<String, dynamic> json) => Charges(
      object: json['object'] as String?,
      hasMore: json['has_more'] as bool?,
      totalCount: json['total_count'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ChargesToJson(Charges instance) => <String, dynamic>{
      'object': instance.object,
      'has_more': instance.hasMore,
      'total_count': instance.totalCount,
      'url': instance.url,
    };

PaymentMethodOptions _$PaymentMethodOptionsFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodOptions(
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentMethodOptionsToJson(
        PaymentMethodOptions instance) =>
    <String, dynamic>{
      'card': instance.card,
    };

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      requestThreeDSecure: json['request_three_d_secure'] as String?,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'request_three_d_secure': instance.requestThreeDSecure,
    };
