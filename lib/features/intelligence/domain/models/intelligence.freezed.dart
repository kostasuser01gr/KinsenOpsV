// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intelligence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImportBatch {

 String get id; String get fileName; String get fileType;// 'csv', 'xlsx', 'pdf'
 DateTime get uploadedAt; String get status;// 'pending_mapping', 'preview', 'completed', 'failed'
 List<Map<String, String>> get rawData; Map<String, String> get columnMapping; List<String> get detectedColumns;
/// Create a copy of ImportBatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportBatchCopyWith<ImportBatch> get copyWith => _$ImportBatchCopyWithImpl<ImportBatch>(this as ImportBatch, _$identity);

  /// Serializes this ImportBatch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.rawData, rawData)&&const DeepCollectionEquality().equals(other.columnMapping, columnMapping)&&const DeepCollectionEquality().equals(other.detectedColumns, detectedColumns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileName,fileType,uploadedAt,status,const DeepCollectionEquality().hash(rawData),const DeepCollectionEquality().hash(columnMapping),const DeepCollectionEquality().hash(detectedColumns));

@override
String toString() {
  return 'ImportBatch(id: $id, fileName: $fileName, fileType: $fileType, uploadedAt: $uploadedAt, status: $status, rawData: $rawData, columnMapping: $columnMapping, detectedColumns: $detectedColumns)';
}


}

/// @nodoc
abstract mixin class $ImportBatchCopyWith<$Res>  {
  factory $ImportBatchCopyWith(ImportBatch value, $Res Function(ImportBatch) _then) = _$ImportBatchCopyWithImpl;
@useResult
$Res call({
 String id, String fileName, String fileType, DateTime uploadedAt, String status, List<Map<String, String>> rawData, Map<String, String> columnMapping, List<String> detectedColumns
});




}
/// @nodoc
class _$ImportBatchCopyWithImpl<$Res>
    implements $ImportBatchCopyWith<$Res> {
  _$ImportBatchCopyWithImpl(this._self, this._then);

  final ImportBatch _self;
  final $Res Function(ImportBatch) _then;

/// Create a copy of ImportBatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileName = null,Object? fileType = null,Object? uploadedAt = null,Object? status = null,Object? rawData = null,Object? columnMapping = null,Object? detectedColumns = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rawData: null == rawData ? _self.rawData : rawData // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,columnMapping: null == columnMapping ? _self.columnMapping : columnMapping // ignore: cast_nullable_to_non_nullable
as Map<String, String>,detectedColumns: null == detectedColumns ? _self.detectedColumns : detectedColumns // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportBatch].
extension ImportBatchPatterns on ImportBatch {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportBatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportBatch() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportBatch value)  $default,){
final _that = this;
switch (_that) {
case _ImportBatch():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportBatch value)?  $default,){
final _that = this;
switch (_that) {
case _ImportBatch() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fileName,  String fileType,  DateTime uploadedAt,  String status,  List<Map<String, String>> rawData,  Map<String, String> columnMapping,  List<String> detectedColumns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportBatch() when $default != null:
return $default(_that.id,_that.fileName,_that.fileType,_that.uploadedAt,_that.status,_that.rawData,_that.columnMapping,_that.detectedColumns);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fileName,  String fileType,  DateTime uploadedAt,  String status,  List<Map<String, String>> rawData,  Map<String, String> columnMapping,  List<String> detectedColumns)  $default,) {final _that = this;
switch (_that) {
case _ImportBatch():
return $default(_that.id,_that.fileName,_that.fileType,_that.uploadedAt,_that.status,_that.rawData,_that.columnMapping,_that.detectedColumns);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fileName,  String fileType,  DateTime uploadedAt,  String status,  List<Map<String, String>> rawData,  Map<String, String> columnMapping,  List<String> detectedColumns)?  $default,) {final _that = this;
switch (_that) {
case _ImportBatch() when $default != null:
return $default(_that.id,_that.fileName,_that.fileType,_that.uploadedAt,_that.status,_that.rawData,_that.columnMapping,_that.detectedColumns);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImportBatch implements ImportBatch {
  const _ImportBatch({required this.id, required this.fileName, required this.fileType, required this.uploadedAt, required this.status, final  List<Map<String, String>> rawData = const [], final  Map<String, String> columnMapping = const {}, final  List<String> detectedColumns = const []}): _rawData = rawData,_columnMapping = columnMapping,_detectedColumns = detectedColumns;
  factory _ImportBatch.fromJson(Map<String, dynamic> json) => _$ImportBatchFromJson(json);

@override final  String id;
@override final  String fileName;
@override final  String fileType;
// 'csv', 'xlsx', 'pdf'
@override final  DateTime uploadedAt;
@override final  String status;
// 'pending_mapping', 'preview', 'completed', 'failed'
 final  List<Map<String, String>> _rawData;
// 'pending_mapping', 'preview', 'completed', 'failed'
@override@JsonKey() List<Map<String, String>> get rawData {
  if (_rawData is EqualUnmodifiableListView) return _rawData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rawData);
}

 final  Map<String, String> _columnMapping;
@override@JsonKey() Map<String, String> get columnMapping {
  if (_columnMapping is EqualUnmodifiableMapView) return _columnMapping;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_columnMapping);
}

 final  List<String> _detectedColumns;
@override@JsonKey() List<String> get detectedColumns {
  if (_detectedColumns is EqualUnmodifiableListView) return _detectedColumns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_detectedColumns);
}


/// Create a copy of ImportBatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportBatchCopyWith<_ImportBatch> get copyWith => __$ImportBatchCopyWithImpl<_ImportBatch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImportBatchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._rawData, _rawData)&&const DeepCollectionEquality().equals(other._columnMapping, _columnMapping)&&const DeepCollectionEquality().equals(other._detectedColumns, _detectedColumns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileName,fileType,uploadedAt,status,const DeepCollectionEquality().hash(_rawData),const DeepCollectionEquality().hash(_columnMapping),const DeepCollectionEquality().hash(_detectedColumns));

@override
String toString() {
  return 'ImportBatch(id: $id, fileName: $fileName, fileType: $fileType, uploadedAt: $uploadedAt, status: $status, rawData: $rawData, columnMapping: $columnMapping, detectedColumns: $detectedColumns)';
}


}

/// @nodoc
abstract mixin class _$ImportBatchCopyWith<$Res> implements $ImportBatchCopyWith<$Res> {
  factory _$ImportBatchCopyWith(_ImportBatch value, $Res Function(_ImportBatch) _then) = __$ImportBatchCopyWithImpl;
@override @useResult
$Res call({
 String id, String fileName, String fileType, DateTime uploadedAt, String status, List<Map<String, String>> rawData, Map<String, String> columnMapping, List<String> detectedColumns
});




}
/// @nodoc
class __$ImportBatchCopyWithImpl<$Res>
    implements _$ImportBatchCopyWith<$Res> {
  __$ImportBatchCopyWithImpl(this._self, this._then);

  final _ImportBatch _self;
  final $Res Function(_ImportBatch) _then;

/// Create a copy of ImportBatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileName = null,Object? fileType = null,Object? uploadedAt = null,Object? status = null,Object? rawData = null,Object? columnMapping = null,Object? detectedColumns = null,}) {
  return _then(_ImportBatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rawData: null == rawData ? _self._rawData : rawData // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,columnMapping: null == columnMapping ? _self._columnMapping : columnMapping // ignore: cast_nullable_to_non_nullable
as Map<String, String>,detectedColumns: null == detectedColumns ? _self._detectedColumns : detectedColumns // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$AISuggestion {

 String get id; String get type;// 'shift_schedule', 'fleet_priority', 'washer_queue'
 String get title; String get reasoning; Map<String, dynamic> get suggestedChanges; DateTime get generatedAt; String get status;// 'pending', 'approved', 'declined'
 double? get confidenceScore;
/// Create a copy of AISuggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AISuggestionCopyWith<AISuggestion> get copyWith => _$AISuggestionCopyWithImpl<AISuggestion>(this as AISuggestion, _$identity);

  /// Serializes this AISuggestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AISuggestion&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.reasoning, reasoning) || other.reasoning == reasoning)&&const DeepCollectionEquality().equals(other.suggestedChanges, suggestedChanges)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,reasoning,const DeepCollectionEquality().hash(suggestedChanges),generatedAt,status,confidenceScore);

@override
String toString() {
  return 'AISuggestion(id: $id, type: $type, title: $title, reasoning: $reasoning, suggestedChanges: $suggestedChanges, generatedAt: $generatedAt, status: $status, confidenceScore: $confidenceScore)';
}


}

/// @nodoc
abstract mixin class $AISuggestionCopyWith<$Res>  {
  factory $AISuggestionCopyWith(AISuggestion value, $Res Function(AISuggestion) _then) = _$AISuggestionCopyWithImpl;
@useResult
$Res call({
 String id, String type, String title, String reasoning, Map<String, dynamic> suggestedChanges, DateTime generatedAt, String status, double? confidenceScore
});




}
/// @nodoc
class _$AISuggestionCopyWithImpl<$Res>
    implements $AISuggestionCopyWith<$Res> {
  _$AISuggestionCopyWithImpl(this._self, this._then);

  final AISuggestion _self;
  final $Res Function(AISuggestion) _then;

/// Create a copy of AISuggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? reasoning = null,Object? suggestedChanges = null,Object? generatedAt = null,Object? status = null,Object? confidenceScore = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as String,suggestedChanges: null == suggestedChanges ? _self.suggestedChanges : suggestedChanges // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,confidenceScore: freezed == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AISuggestion].
extension AISuggestionPatterns on AISuggestion {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AISuggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AISuggestion() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AISuggestion value)  $default,){
final _that = this;
switch (_that) {
case _AISuggestion():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AISuggestion value)?  $default,){
final _that = this;
switch (_that) {
case _AISuggestion() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String reasoning,  Map<String, dynamic> suggestedChanges,  DateTime generatedAt,  String status,  double? confidenceScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AISuggestion() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.reasoning,_that.suggestedChanges,_that.generatedAt,_that.status,_that.confidenceScore);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String reasoning,  Map<String, dynamic> suggestedChanges,  DateTime generatedAt,  String status,  double? confidenceScore)  $default,) {final _that = this;
switch (_that) {
case _AISuggestion():
return $default(_that.id,_that.type,_that.title,_that.reasoning,_that.suggestedChanges,_that.generatedAt,_that.status,_that.confidenceScore);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String title,  String reasoning,  Map<String, dynamic> suggestedChanges,  DateTime generatedAt,  String status,  double? confidenceScore)?  $default,) {final _that = this;
switch (_that) {
case _AISuggestion() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.reasoning,_that.suggestedChanges,_that.generatedAt,_that.status,_that.confidenceScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AISuggestion implements AISuggestion {
  const _AISuggestion({required this.id, required this.type, required this.title, required this.reasoning, required final  Map<String, dynamic> suggestedChanges, required this.generatedAt, this.status = 'pending', this.confidenceScore}): _suggestedChanges = suggestedChanges;
  factory _AISuggestion.fromJson(Map<String, dynamic> json) => _$AISuggestionFromJson(json);

@override final  String id;
@override final  String type;
// 'shift_schedule', 'fleet_priority', 'washer_queue'
@override final  String title;
@override final  String reasoning;
 final  Map<String, dynamic> _suggestedChanges;
@override Map<String, dynamic> get suggestedChanges {
  if (_suggestedChanges is EqualUnmodifiableMapView) return _suggestedChanges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_suggestedChanges);
}

@override final  DateTime generatedAt;
@override@JsonKey() final  String status;
// 'pending', 'approved', 'declined'
@override final  double? confidenceScore;

/// Create a copy of AISuggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AISuggestionCopyWith<_AISuggestion> get copyWith => __$AISuggestionCopyWithImpl<_AISuggestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AISuggestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AISuggestion&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.reasoning, reasoning) || other.reasoning == reasoning)&&const DeepCollectionEquality().equals(other._suggestedChanges, _suggestedChanges)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,reasoning,const DeepCollectionEquality().hash(_suggestedChanges),generatedAt,status,confidenceScore);

@override
String toString() {
  return 'AISuggestion(id: $id, type: $type, title: $title, reasoning: $reasoning, suggestedChanges: $suggestedChanges, generatedAt: $generatedAt, status: $status, confidenceScore: $confidenceScore)';
}


}

/// @nodoc
abstract mixin class _$AISuggestionCopyWith<$Res> implements $AISuggestionCopyWith<$Res> {
  factory _$AISuggestionCopyWith(_AISuggestion value, $Res Function(_AISuggestion) _then) = __$AISuggestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String title, String reasoning, Map<String, dynamic> suggestedChanges, DateTime generatedAt, String status, double? confidenceScore
});




}
/// @nodoc
class __$AISuggestionCopyWithImpl<$Res>
    implements _$AISuggestionCopyWith<$Res> {
  __$AISuggestionCopyWithImpl(this._self, this._then);

  final _AISuggestion _self;
  final $Res Function(_AISuggestion) _then;

/// Create a copy of AISuggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? reasoning = null,Object? suggestedChanges = null,Object? generatedAt = null,Object? status = null,Object? confidenceScore = freezed,}) {
  return _then(_AISuggestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,reasoning: null == reasoning ? _self.reasoning : reasoning // ignore: cast_nullable_to_non_nullable
as String,suggestedChanges: null == suggestedChanges ? _self._suggestedChanges : suggestedChanges // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,confidenceScore: freezed == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$AuditLog {

 String get id; String get userId; String get action;// 'create', 'update', 'delete', 'import', 'ai_approve'
 String get entityType; String get entityId; DateTime get timestamp; Map<String, dynamic> get changes;// { 'old': ..., 'new': ... }
 String? get correlationId;
/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditLogCopyWith<AuditLog> get copyWith => _$AuditLogCopyWithImpl<AuditLog>(this as AuditLog, _$identity);

  /// Serializes this AuditLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditLog&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.action, action) || other.action == action)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.changes, changes)&&(identical(other.correlationId, correlationId) || other.correlationId == correlationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,action,entityType,entityId,timestamp,const DeepCollectionEquality().hash(changes),correlationId);

@override
String toString() {
  return 'AuditLog(id: $id, userId: $userId, action: $action, entityType: $entityType, entityId: $entityId, timestamp: $timestamp, changes: $changes, correlationId: $correlationId)';
}


}

/// @nodoc
abstract mixin class $AuditLogCopyWith<$Res>  {
  factory $AuditLogCopyWith(AuditLog value, $Res Function(AuditLog) _then) = _$AuditLogCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String action, String entityType, String entityId, DateTime timestamp, Map<String, dynamic> changes, String? correlationId
});




}
/// @nodoc
class _$AuditLogCopyWithImpl<$Res>
    implements $AuditLogCopyWith<$Res> {
  _$AuditLogCopyWithImpl(this._self, this._then);

  final AuditLog _self;
  final $Res Function(AuditLog) _then;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? action = null,Object? entityType = null,Object? entityId = null,Object? timestamp = null,Object? changes = null,Object? correlationId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,entityType: null == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String,entityId: null == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,changes: null == changes ? _self.changes : changes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,correlationId: freezed == correlationId ? _self.correlationId : correlationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditLog].
extension AuditLogPatterns on AuditLog {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditLog value)  $default,){
final _that = this;
switch (_that) {
case _AuditLog():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditLog value)?  $default,){
final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String action,  String entityType,  String entityId,  DateTime timestamp,  Map<String, dynamic> changes,  String? correlationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
return $default(_that.id,_that.userId,_that.action,_that.entityType,_that.entityId,_that.timestamp,_that.changes,_that.correlationId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String action,  String entityType,  String entityId,  DateTime timestamp,  Map<String, dynamic> changes,  String? correlationId)  $default,) {final _that = this;
switch (_that) {
case _AuditLog():
return $default(_that.id,_that.userId,_that.action,_that.entityType,_that.entityId,_that.timestamp,_that.changes,_that.correlationId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String action,  String entityType,  String entityId,  DateTime timestamp,  Map<String, dynamic> changes,  String? correlationId)?  $default,) {final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
return $default(_that.id,_that.userId,_that.action,_that.entityType,_that.entityId,_that.timestamp,_that.changes,_that.correlationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditLog implements AuditLog {
  const _AuditLog({required this.id, required this.userId, required this.action, required this.entityType, required this.entityId, required this.timestamp, required final  Map<String, dynamic> changes, this.correlationId}): _changes = changes;
  factory _AuditLog.fromJson(Map<String, dynamic> json) => _$AuditLogFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String action;
// 'create', 'update', 'delete', 'import', 'ai_approve'
@override final  String entityType;
@override final  String entityId;
@override final  DateTime timestamp;
 final  Map<String, dynamic> _changes;
@override Map<String, dynamic> get changes {
  if (_changes is EqualUnmodifiableMapView) return _changes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_changes);
}

// { 'old': ..., 'new': ... }
@override final  String? correlationId;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditLogCopyWith<_AuditLog> get copyWith => __$AuditLogCopyWithImpl<_AuditLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditLog&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.action, action) || other.action == action)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._changes, _changes)&&(identical(other.correlationId, correlationId) || other.correlationId == correlationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,action,entityType,entityId,timestamp,const DeepCollectionEquality().hash(_changes),correlationId);

@override
String toString() {
  return 'AuditLog(id: $id, userId: $userId, action: $action, entityType: $entityType, entityId: $entityId, timestamp: $timestamp, changes: $changes, correlationId: $correlationId)';
}


}

/// @nodoc
abstract mixin class _$AuditLogCopyWith<$Res> implements $AuditLogCopyWith<$Res> {
  factory _$AuditLogCopyWith(_AuditLog value, $Res Function(_AuditLog) _then) = __$AuditLogCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String action, String entityType, String entityId, DateTime timestamp, Map<String, dynamic> changes, String? correlationId
});




}
/// @nodoc
class __$AuditLogCopyWithImpl<$Res>
    implements _$AuditLogCopyWith<$Res> {
  __$AuditLogCopyWithImpl(this._self, this._then);

  final _AuditLog _self;
  final $Res Function(_AuditLog) _then;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? action = null,Object? entityType = null,Object? entityId = null,Object? timestamp = null,Object? changes = null,Object? correlationId = freezed,}) {
  return _then(_AuditLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,entityType: null == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String,entityId: null == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,changes: null == changes ? _self._changes : changes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,correlationId: freezed == correlationId ? _self.correlationId : correlationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
