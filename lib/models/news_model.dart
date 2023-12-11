import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class News with _$News {
  const factory News({
    required int id,
    required DateTime date,
    required DateTime modified,
    required String slug,
    required NewRendered title,
    required NewRendered content,
    required String format,
    required String link,
    NewRendered? excerpt,
    @JsonKey(name: 'jetpack_featured_media_url') String? image,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  const News._();
}

@freezed
class NewRendered with _$NewRendered {
  const factory NewRendered({
    required String rendered,
  }) = _NewRendered;

  factory NewRendered.fromJson(Map<String, dynamic> json) => _$NewRenderedFromJson(json);

  const NewRendered._();
}
