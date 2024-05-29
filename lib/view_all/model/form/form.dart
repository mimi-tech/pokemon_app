import "package:freezed_annotation/freezed_annotation.dart";

part "form.freezed.dart";
part "form.g.dart";

@Freezed()
class Form with _$Form {
  factory Form({String? name, String? url}) = _Form;
  const Form._();

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);
}
