// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
mixin _$News {
  int get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get modified => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  NewRendered get title => throw _privateConstructorUsedError;
  NewRendered get content => throw _privateConstructorUsedError;
  String get format => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  NewRendered? get excerpt => throw _privateConstructorUsedError;
  @JsonKey(name: 'jetpack_featured_media_url')
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res, News>;
  @useResult
  $Res call(
      {int id,
      DateTime date,
      DateTime modified,
      String slug,
      NewRendered title,
      NewRendered content,
      String format,
      String link,
      NewRendered? excerpt,
      @JsonKey(name: 'jetpack_featured_media_url') String? image});

  $NewRenderedCopyWith<$Res> get title;
  $NewRenderedCopyWith<$Res> get content;
  $NewRenderedCopyWith<$Res>? get excerpt;
}

/// @nodoc
class _$NewsCopyWithImpl<$Res, $Val extends News>
    implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? modified = null,
    Object? slug = null,
    Object? title = null,
    Object? content = null,
    Object? format = null,
    Object? link = null,
    Object? excerpt = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as NewRendered,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as NewRendered,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      excerpt: freezed == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as NewRendered?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NewRenderedCopyWith<$Res> get title {
    return $NewRenderedCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NewRenderedCopyWith<$Res> get content {
    return $NewRenderedCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NewRenderedCopyWith<$Res>? get excerpt {
    if (_value.excerpt == null) {
      return null;
    }

    return $NewRenderedCopyWith<$Res>(_value.excerpt!, (value) {
      return _then(_value.copyWith(excerpt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
          _$NewsImpl value, $Res Function(_$NewsImpl) then) =
      __$$NewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime date,
      DateTime modified,
      String slug,
      NewRendered title,
      NewRendered content,
      String format,
      String link,
      NewRendered? excerpt,
      @JsonKey(name: 'jetpack_featured_media_url') String? image});

  @override
  $NewRenderedCopyWith<$Res> get title;
  @override
  $NewRenderedCopyWith<$Res> get content;
  @override
  $NewRenderedCopyWith<$Res>? get excerpt;
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? modified = null,
    Object? slug = null,
    Object? title = null,
    Object? content = null,
    Object? format = null,
    Object? link = null,
    Object? excerpt = freezed,
    Object? image = freezed,
  }) {
    return _then(_$NewsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as NewRendered,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as NewRendered,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      excerpt: freezed == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as NewRendered?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsImpl extends _News {
  const _$NewsImpl(
      {required this.id,
      required this.date,
      required this.modified,
      required this.slug,
      required this.title,
      required this.content,
      required this.format,
      required this.link,
      this.excerpt,
      @JsonKey(name: 'jetpack_featured_media_url') this.image})
      : super._();

  factory _$NewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsImplFromJson(json);

  @override
  final int id;
  @override
  final DateTime date;
  @override
  final DateTime modified;
  @override
  final String slug;
  @override
  final NewRendered title;
  @override
  final NewRendered content;
  @override
  final String format;
  @override
  final String link;
  @override
  final NewRendered? excerpt;
  @override
  @JsonKey(name: 'jetpack_featured_media_url')
  final String? image;

  @override
  String toString() {
    return 'News(id: $id, date: $date, modified: $modified, slug: $slug, title: $title, content: $content, format: $format, link: $link, excerpt: $excerpt, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.excerpt, excerpt) || other.excerpt == excerpt) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, modified, slug, title,
      content, format, link, excerpt, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsImplToJson(
      this,
    );
  }
}

abstract class _News extends News {
  const factory _News(
          {required final int id,
          required final DateTime date,
          required final DateTime modified,
          required final String slug,
          required final NewRendered title,
          required final NewRendered content,
          required final String format,
          required final String link,
          final NewRendered? excerpt,
          @JsonKey(name: 'jetpack_featured_media_url') final String? image}) =
      _$NewsImpl;
  const _News._() : super._();

  factory _News.fromJson(Map<String, dynamic> json) = _$NewsImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get date;
  @override
  DateTime get modified;
  @override
  String get slug;
  @override
  NewRendered get title;
  @override
  NewRendered get content;
  @override
  String get format;
  @override
  String get link;
  @override
  NewRendered? get excerpt;
  @override
  @JsonKey(name: 'jetpack_featured_media_url')
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewRendered _$NewRenderedFromJson(Map<String, dynamic> json) {
  return _NewRendered.fromJson(json);
}

/// @nodoc
mixin _$NewRendered {
  String get rendered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewRenderedCopyWith<NewRendered> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewRenderedCopyWith<$Res> {
  factory $NewRenderedCopyWith(
          NewRendered value, $Res Function(NewRendered) then) =
      _$NewRenderedCopyWithImpl<$Res, NewRendered>;
  @useResult
  $Res call({String rendered});
}

/// @nodoc
class _$NewRenderedCopyWithImpl<$Res, $Val extends NewRendered>
    implements $NewRenderedCopyWith<$Res> {
  _$NewRenderedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rendered = null,
  }) {
    return _then(_value.copyWith(
      rendered: null == rendered
          ? _value.rendered
          : rendered // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewRenderedImplCopyWith<$Res>
    implements $NewRenderedCopyWith<$Res> {
  factory _$$NewRenderedImplCopyWith(
          _$NewRenderedImpl value, $Res Function(_$NewRenderedImpl) then) =
      __$$NewRenderedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rendered});
}

/// @nodoc
class __$$NewRenderedImplCopyWithImpl<$Res>
    extends _$NewRenderedCopyWithImpl<$Res, _$NewRenderedImpl>
    implements _$$NewRenderedImplCopyWith<$Res> {
  __$$NewRenderedImplCopyWithImpl(
      _$NewRenderedImpl _value, $Res Function(_$NewRenderedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rendered = null,
  }) {
    return _then(_$NewRenderedImpl(
      rendered: null == rendered
          ? _value.rendered
          : rendered // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewRenderedImpl extends _NewRendered {
  const _$NewRenderedImpl({required this.rendered}) : super._();

  factory _$NewRenderedImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewRenderedImplFromJson(json);

  @override
  final String rendered;

  @override
  String toString() {
    return 'NewRendered(rendered: $rendered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewRenderedImpl &&
            (identical(other.rendered, rendered) ||
                other.rendered == rendered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rendered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewRenderedImplCopyWith<_$NewRenderedImpl> get copyWith =>
      __$$NewRenderedImplCopyWithImpl<_$NewRenderedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewRenderedImplToJson(
      this,
    );
  }
}

abstract class _NewRendered extends NewRendered {
  const factory _NewRendered({required final String rendered}) =
      _$NewRenderedImpl;
  const _NewRendered._() : super._();

  factory _NewRendered.fromJson(Map<String, dynamic> json) =
      _$NewRenderedImpl.fromJson;

  @override
  String get rendered;
  @override
  @JsonKey(ignore: true)
  _$$NewRenderedImplCopyWith<_$NewRenderedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
