import 'package:json_annotation/json_annotation.dart';

part 'color_model.g.dart';

@JsonSerializable()
class ColorModel {
  final int id;
  final String title;
  final String userName;
  final int numViews;
  final int numVotes;
  final int numComments;
  final int numHearts;
  final int rank;
  final DateTime dateCreated;
  final String hex;
  final String description;
  final String url;
  final String imageUrl;
  final String badgeUrl;
  final String apiUrl;

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);

  ColorModel(
      this.id,
      this.title,
      this.userName,
      this.numViews,
      this.numVotes,
      this.numComments,
      this.numHearts,
      this.rank,
      this.dateCreated,
      this.hex,
      this.description,
      this.url,
      this.imageUrl,
      this.badgeUrl,
      this.apiUrl);

  Map<String, dynamic> toJson() => _$ColorModelToJson(this);
}
