import 'package:json_annotation/json_annotation.dart';
part 'starship.g.dart';

@JsonSerializable(createToJson: false)
class Starship {
  @JsonKey(name: 'ship_id')
  final String id;
  @JsonKey(name: 'ship_name')
  final String? name;
  @JsonKey(name: 'ship_model')
  final String? model;
  @JsonKey(name: 'ship_type')
  final String? type;
  @JsonKey(name: 'weight_kg')
  final int? weight;
  final String? status;
  final String? role;

  Starship(
    this.id,
    this.name,
    this.model,
    this.type,
    this.weight,
    this.status,
    this.role,
  );

  factory Starship.fromJson(Map<String, dynamic> json) =>
      _$StarshipFromJson(json);
}
