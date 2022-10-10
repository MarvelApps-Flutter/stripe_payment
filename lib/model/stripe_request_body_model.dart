import 'package:json_annotation/json_annotation.dart';
part 'stripe_request_body_model.g.dart';

@JsonSerializable()
class StripeBodyRequestModel {
  @JsonKey(name: "amount")
  String? amount;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "payment_method_types[]")
  String? paymentMethodTypes;

  StripeBodyRequestModel({this.amount, this.currency, this.paymentMethodTypes});

  factory StripeBodyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$StripeBodyRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$StripeBodyRequestModelToJson(this);
}
