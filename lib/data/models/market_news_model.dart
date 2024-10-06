import 'package:blott_assessment/domain/domain.dart';
import 'package:equatable/equatable.dart';

class MarketNewsModel with EquatableMixin {
  const MarketNewsModel({
    required this.category,
    required this.datetime,
    required this.headline,
    required this.id,
    required this.image,
    required this.related,
    required this.source,
    required this.summary,
    required this.url,
  });

  factory MarketNewsModel.fromJson(Map<String, dynamic> json) {
    return MarketNewsModel(
      category: json['category'] as String?,
      datetime: json['datetime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (json['datetime'] as int) * 1000,
            )
          : null,
      headline: json['headline'] as String?,
      id: json['id'] as int?,
      image: json['image'] as String?,
      related: json['related'] as String?,
      source: json['source'] as String?,
      summary: json['summary'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'datetime': datetime?.millisecondsSinceEpoch,
      'headline': headline,
      'id': id,
      'image': image,
      'related': related,
      'source': source,
      'summary': summary,
      'url': url,
    };
  }

  final String? category;
  final DateTime? datetime;
  final String? headline;
  final int? id;
  final String? image;
  final String? related;
  final String? source;
  final String? summary;
  final String? url;

  @override
  List<Object?> get props => [
        category,
        datetime,
        headline,
        id,
        image,
        related,
        source,
        summary,
        url,
      ];
}

extension MarketNewsModelExtension on MarketNewsEntity {
  MarketNewsModel toModel() {
    return MarketNewsModel(
      category: category,
      datetime: datetime,
      headline: headline,
      id: id,
      image: image,
      related: related,
      source: source,
      summary: summary,
      url: url,
    );
  }
}

extension MarketNewsEntityExtension on MarketNewsModel {
  MarketNewsEntity toEntity() {
    return MarketNewsEntity(
      category: category,
      datetime: datetime,
      headline: headline,
      id: id,
      image: image,
      related: related,
      source: source,
      summary: summary,
      url: url,
    );
  }
}
