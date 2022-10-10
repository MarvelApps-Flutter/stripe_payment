import 'package:json_annotation/json_annotation.dart';
part 'stripe_payment_response_model.g.dart';

@JsonSerializable()
class StripePaymentResponseModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "object")
  String? object;
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "amount_capturable")
  int? amountCapturable;
  @JsonKey(name: "amount_received")
  int? amountReceived;
  @JsonKey(name: "capture_method")
  String? captureMethod;
  @JsonKey(name: "charges")
  Charges? charges;
  @JsonKey(name: "client_secret")
  String? clientSecret;
  @JsonKey(name: "confirmation_method")
  String? confirmationMethod;
  @JsonKey(name: "created")
  int? created;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "livemode")
  bool? livemode;
  @JsonKey(name: "payment_method_options")
  PaymentMethodOptions? paymentMethodOptions;
  @JsonKey(name: "payment_method_types")
  List<String>? paymentMethodTypes;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "error")
  Error? error;

  StripePaymentResponseModel({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountReceived,
    this.captureMethod,
    this.charges,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.livemode,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.status,
  });
  factory StripePaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StripePaymentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StripePaymentResponseModelToJson(this);
}

@JsonSerializable()
class Charges {
  @JsonKey(name: "object")
  String? object;
  @JsonKey(name: "has_more")
  bool? hasMore;
  @JsonKey(name: "total_count")
  int? totalCount;
  @JsonKey(name: "url")
  String? url;

  Charges({
    this.object,
    this.hasMore,
    this.totalCount,
    this.url,
  });
  factory Charges.fromJson(Map<String, dynamic> json) =>
      _$ChargesFromJson(json);

  Map<String, dynamic> toJson() => _$ChargesToJson(this);
}

@JsonSerializable()
class PaymentMethodOptions {
  @JsonKey(name: "card")
  Card? card;

  PaymentMethodOptions({this.card});
  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodOptionsToJson(this);
}

@JsonSerializable()
class Card {
  @JsonKey(name: "request_three_d_secure")
  String? requestThreeDSecure;

  Card({this.requestThreeDSecure});
  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}

class Error {
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "doc_url")
  String? docUrl;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "type")
  String? type;

  Error({this.code, this.docUrl, this.message, this.type});
}
