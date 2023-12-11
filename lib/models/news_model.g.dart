// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      id: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      modified: DateTime.parse(json['modified'] as String),
      slug: json['slug'] as String,
      title: NewRendered.fromJson(json['title'] as Map<String, dynamic>),
      content: NewRendered.fromJson(json['content'] as Map<String, dynamic>),
      format: json['format'] as String,
      link: json['link'] as String,
      excerpt: json['excerpt'] == null
          ? null
          : NewRendered.fromJson(json['excerpt'] as Map<String, dynamic>),
      image: json['jetpack_featured_media_url'] as String?,
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'modified': instance.modified.toIso8601String(),
      'slug': instance.slug,
      'title': instance.title,
      'content': instance.content,
      'format': instance.format,
      'link': instance.link,
      'excerpt': instance.excerpt,
      'jetpack_featured_media_url': instance.image,
    };

_$NewRenderedImpl _$$NewRenderedImplFromJson(Map<String, dynamic> json) =>
    _$NewRenderedImpl(
      rendered: json['rendered'] as String,
    );

Map<String, dynamic> _$$NewRenderedImplToJson(_$NewRenderedImpl instance) =>
    <String, dynamic>{
      'rendered': instance.rendered,
    };
