// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessage {

 String get id; String get senderId; String get senderName; String get content; DateTime get timestamp; List<String> get attachments; String? get replyToId; Map<String, int> get reactions; String? get entityId;// ID of the linked vehicle, shift, or task
 String? get entityType;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.content, content) || other.content == content)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.replyToId, replyToId) || other.replyToId == replyToId)&&const DeepCollectionEquality().equals(other.reactions, reactions)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.entityType, entityType) || other.entityType == entityType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,senderName,content,timestamp,const DeepCollectionEquality().hash(attachments),replyToId,const DeepCollectionEquality().hash(reactions),entityId,entityType);

@override
String toString() {
  return 'ChatMessage(id: $id, senderId: $senderId, senderName: $senderName, content: $content, timestamp: $timestamp, attachments: $attachments, replyToId: $replyToId, reactions: $reactions, entityId: $entityId, entityType: $entityType)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String id, String senderId, String senderName, String content, DateTime timestamp, List<String> attachments, String? replyToId, Map<String, int> reactions, String? entityId, String? entityType
});




}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? senderId = null,Object? senderName = null,Object? content = null,Object? timestamp = null,Object? attachments = null,Object? replyToId = freezed,Object? reactions = null,Object? entityId = freezed,Object? entityType = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,replyToId: freezed == replyToId ? _self.replyToId : replyToId // ignore: cast_nullable_to_non_nullable
as String?,reactions: null == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as Map<String, int>,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,entityType: freezed == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String senderId,  String senderName,  String content,  DateTime timestamp,  List<String> attachments,  String? replyToId,  Map<String, int> reactions,  String? entityId,  String? entityType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.senderId,_that.senderName,_that.content,_that.timestamp,_that.attachments,_that.replyToId,_that.reactions,_that.entityId,_that.entityType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String senderId,  String senderName,  String content,  DateTime timestamp,  List<String> attachments,  String? replyToId,  Map<String, int> reactions,  String? entityId,  String? entityType)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.id,_that.senderId,_that.senderName,_that.content,_that.timestamp,_that.attachments,_that.replyToId,_that.reactions,_that.entityId,_that.entityType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String senderId,  String senderName,  String content,  DateTime timestamp,  List<String> attachments,  String? replyToId,  Map<String, int> reactions,  String? entityId,  String? entityType)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.senderId,_that.senderName,_that.content,_that.timestamp,_that.attachments,_that.replyToId,_that.reactions,_that.entityId,_that.entityType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessage implements ChatMessage {
  const _ChatMessage({required this.id, required this.senderId, required this.senderName, required this.content, required this.timestamp, final  List<String> attachments = const [], this.replyToId, final  Map<String, int> reactions = const {}, this.entityId, this.entityType}): _attachments = attachments,_reactions = reactions;
  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

@override final  String id;
@override final  String senderId;
@override final  String senderName;
@override final  String content;
@override final  DateTime timestamp;
 final  List<String> _attachments;
@override@JsonKey() List<String> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  String? replyToId;
 final  Map<String, int> _reactions;
@override@JsonKey() Map<String, int> get reactions {
  if (_reactions is EqualUnmodifiableMapView) return _reactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_reactions);
}

@override final  String? entityId;
// ID of the linked vehicle, shift, or task
@override final  String? entityType;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.content, content) || other.content == content)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.replyToId, replyToId) || other.replyToId == replyToId)&&const DeepCollectionEquality().equals(other._reactions, _reactions)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.entityType, entityType) || other.entityType == entityType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,senderName,content,timestamp,const DeepCollectionEquality().hash(_attachments),replyToId,const DeepCollectionEquality().hash(_reactions),entityId,entityType);

@override
String toString() {
  return 'ChatMessage(id: $id, senderId: $senderId, senderName: $senderName, content: $content, timestamp: $timestamp, attachments: $attachments, replyToId: $replyToId, reactions: $reactions, entityId: $entityId, entityType: $entityType)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String senderId, String senderName, String content, DateTime timestamp, List<String> attachments, String? replyToId, Map<String, int> reactions, String? entityId, String? entityType
});




}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? senderId = null,Object? senderName = null,Object? content = null,Object? timestamp = null,Object? attachments = null,Object? replyToId = freezed,Object? reactions = null,Object? entityId = freezed,Object? entityType = freezed,}) {
  return _then(_ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,replyToId: freezed == replyToId ? _self.replyToId : replyToId // ignore: cast_nullable_to_non_nullable
as String?,reactions: null == reactions ? _self._reactions : reactions // ignore: cast_nullable_to_non_nullable
as Map<String, int>,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,entityType: freezed == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ChatChannel {

 String get id; String get name; String get type;// 'group', 'dm', 'entity'
 String? get description; List<String> get memberIds; ChatMessage? get lastMessage; int get unreadCount; String? get linkedEntityId;
/// Create a copy of ChatChannel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatChannelCopyWith<ChatChannel> get copyWith => _$ChatChannelCopyWithImpl<ChatChannel>(this as ChatChannel, _$identity);

  /// Serializes this ChatChannel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatChannel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.memberIds, memberIds)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.linkedEntityId, linkedEntityId) || other.linkedEntityId == linkedEntityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,description,const DeepCollectionEquality().hash(memberIds),lastMessage,unreadCount,linkedEntityId);

@override
String toString() {
  return 'ChatChannel(id: $id, name: $name, type: $type, description: $description, memberIds: $memberIds, lastMessage: $lastMessage, unreadCount: $unreadCount, linkedEntityId: $linkedEntityId)';
}


}

/// @nodoc
abstract mixin class $ChatChannelCopyWith<$Res>  {
  factory $ChatChannelCopyWith(ChatChannel value, $Res Function(ChatChannel) _then) = _$ChatChannelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, String? description, List<String> memberIds, ChatMessage? lastMessage, int unreadCount, String? linkedEntityId
});


$ChatMessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class _$ChatChannelCopyWithImpl<$Res>
    implements $ChatChannelCopyWith<$Res> {
  _$ChatChannelCopyWithImpl(this._self, this._then);

  final ChatChannel _self;
  final $Res Function(ChatChannel) _then;

/// Create a copy of ChatChannel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? description = freezed,Object? memberIds = null,Object? lastMessage = freezed,Object? unreadCount = null,Object? linkedEntityId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,memberIds: null == memberIds ? _self.memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as ChatMessage?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,linkedEntityId: freezed == linkedEntityId ? _self.linkedEntityId : linkedEntityId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ChatChannel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $ChatMessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatChannel].
extension ChatChannelPatterns on ChatChannel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatChannel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatChannel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatChannel value)  $default,){
final _that = this;
switch (_that) {
case _ChatChannel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatChannel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatChannel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  String? description,  List<String> memberIds,  ChatMessage? lastMessage,  int unreadCount,  String? linkedEntityId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatChannel() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.description,_that.memberIds,_that.lastMessage,_that.unreadCount,_that.linkedEntityId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  String? description,  List<String> memberIds,  ChatMessage? lastMessage,  int unreadCount,  String? linkedEntityId)  $default,) {final _that = this;
switch (_that) {
case _ChatChannel():
return $default(_that.id,_that.name,_that.type,_that.description,_that.memberIds,_that.lastMessage,_that.unreadCount,_that.linkedEntityId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  String? description,  List<String> memberIds,  ChatMessage? lastMessage,  int unreadCount,  String? linkedEntityId)?  $default,) {final _that = this;
switch (_that) {
case _ChatChannel() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.description,_that.memberIds,_that.lastMessage,_that.unreadCount,_that.linkedEntityId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatChannel implements ChatChannel {
  const _ChatChannel({required this.id, required this.name, required this.type, this.description, final  List<String> memberIds = const [], this.lastMessage, this.unreadCount = 0, this.linkedEntityId}): _memberIds = memberIds;
  factory _ChatChannel.fromJson(Map<String, dynamic> json) => _$ChatChannelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
// 'group', 'dm', 'entity'
@override final  String? description;
 final  List<String> _memberIds;
@override@JsonKey() List<String> get memberIds {
  if (_memberIds is EqualUnmodifiableListView) return _memberIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberIds);
}

@override final  ChatMessage? lastMessage;
@override@JsonKey() final  int unreadCount;
@override final  String? linkedEntityId;

/// Create a copy of ChatChannel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatChannelCopyWith<_ChatChannel> get copyWith => __$ChatChannelCopyWithImpl<_ChatChannel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatChannelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatChannel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._memberIds, _memberIds)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.linkedEntityId, linkedEntityId) || other.linkedEntityId == linkedEntityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,description,const DeepCollectionEquality().hash(_memberIds),lastMessage,unreadCount,linkedEntityId);

@override
String toString() {
  return 'ChatChannel(id: $id, name: $name, type: $type, description: $description, memberIds: $memberIds, lastMessage: $lastMessage, unreadCount: $unreadCount, linkedEntityId: $linkedEntityId)';
}


}

/// @nodoc
abstract mixin class _$ChatChannelCopyWith<$Res> implements $ChatChannelCopyWith<$Res> {
  factory _$ChatChannelCopyWith(_ChatChannel value, $Res Function(_ChatChannel) _then) = __$ChatChannelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, String? description, List<String> memberIds, ChatMessage? lastMessage, int unreadCount, String? linkedEntityId
});


@override $ChatMessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$ChatChannelCopyWithImpl<$Res>
    implements _$ChatChannelCopyWith<$Res> {
  __$ChatChannelCopyWithImpl(this._self, this._then);

  final _ChatChannel _self;
  final $Res Function(_ChatChannel) _then;

/// Create a copy of ChatChannel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? description = freezed,Object? memberIds = null,Object? lastMessage = freezed,Object? unreadCount = null,Object? linkedEntityId = freezed,}) {
  return _then(_ChatChannel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,memberIds: null == memberIds ? _self._memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as ChatMessage?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,linkedEntityId: freezed == linkedEntityId ? _self.linkedEntityId : linkedEntityId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ChatChannel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $ChatMessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// @nodoc
mixin _$UserPresence {

 String get userId; bool get isOnline; DateTime get lastSeen;
/// Create a copy of UserPresence
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPresenceCopyWith<UserPresence> get copyWith => _$UserPresenceCopyWithImpl<UserPresence>(this as UserPresence, _$identity);

  /// Serializes this UserPresence to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPresence&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,isOnline,lastSeen);

@override
String toString() {
  return 'UserPresence(userId: $userId, isOnline: $isOnline, lastSeen: $lastSeen)';
}


}

/// @nodoc
abstract mixin class $UserPresenceCopyWith<$Res>  {
  factory $UserPresenceCopyWith(UserPresence value, $Res Function(UserPresence) _then) = _$UserPresenceCopyWithImpl;
@useResult
$Res call({
 String userId, bool isOnline, DateTime lastSeen
});




}
/// @nodoc
class _$UserPresenceCopyWithImpl<$Res>
    implements $UserPresenceCopyWith<$Res> {
  _$UserPresenceCopyWithImpl(this._self, this._then);

  final UserPresence _self;
  final $Res Function(UserPresence) _then;

/// Create a copy of UserPresence
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? isOnline = null,Object? lastSeen = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPresence].
extension UserPresencePatterns on UserPresence {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPresence value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPresence() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPresence value)  $default,){
final _that = this;
switch (_that) {
case _UserPresence():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPresence value)?  $default,){
final _that = this;
switch (_that) {
case _UserPresence() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  bool isOnline,  DateTime lastSeen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPresence() when $default != null:
return $default(_that.userId,_that.isOnline,_that.lastSeen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  bool isOnline,  DateTime lastSeen)  $default,) {final _that = this;
switch (_that) {
case _UserPresence():
return $default(_that.userId,_that.isOnline,_that.lastSeen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  bool isOnline,  DateTime lastSeen)?  $default,) {final _that = this;
switch (_that) {
case _UserPresence() when $default != null:
return $default(_that.userId,_that.isOnline,_that.lastSeen);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPresence implements UserPresence {
  const _UserPresence({required this.userId, required this.isOnline, required this.lastSeen});
  factory _UserPresence.fromJson(Map<String, dynamic> json) => _$UserPresenceFromJson(json);

@override final  String userId;
@override final  bool isOnline;
@override final  DateTime lastSeen;

/// Create a copy of UserPresence
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPresenceCopyWith<_UserPresence> get copyWith => __$UserPresenceCopyWithImpl<_UserPresence>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPresenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPresence&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,isOnline,lastSeen);

@override
String toString() {
  return 'UserPresence(userId: $userId, isOnline: $isOnline, lastSeen: $lastSeen)';
}


}

/// @nodoc
abstract mixin class _$UserPresenceCopyWith<$Res> implements $UserPresenceCopyWith<$Res> {
  factory _$UserPresenceCopyWith(_UserPresence value, $Res Function(_UserPresence) _then) = __$UserPresenceCopyWithImpl;
@override @useResult
$Res call({
 String userId, bool isOnline, DateTime lastSeen
});




}
/// @nodoc
class __$UserPresenceCopyWithImpl<$Res>
    implements _$UserPresenceCopyWith<$Res> {
  __$UserPresenceCopyWithImpl(this._self, this._then);

  final _UserPresence _self;
  final $Res Function(_UserPresence) _then;

/// Create a copy of UserPresence
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? isOnline = null,Object? lastSeen = null,}) {
  return _then(_UserPresence(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: null == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$OpsNotification {

 String get id; String get title; String get message; DateTime get timestamp; String get severity;// 'info', 'warning', 'error', 'urgent'
 bool get isRead; bool get isAcknowledged; String? get actionLink; String? get entityId;
/// Create a copy of OpsNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpsNotificationCopyWith<OpsNotification> get copyWith => _$OpsNotificationCopyWithImpl<OpsNotification>(this as OpsNotification, _$identity);

  /// Serializes this OpsNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpsNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isAcknowledged, isAcknowledged) || other.isAcknowledged == isAcknowledged)&&(identical(other.actionLink, actionLink) || other.actionLink == actionLink)&&(identical(other.entityId, entityId) || other.entityId == entityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,message,timestamp,severity,isRead,isAcknowledged,actionLink,entityId);

@override
String toString() {
  return 'OpsNotification(id: $id, title: $title, message: $message, timestamp: $timestamp, severity: $severity, isRead: $isRead, isAcknowledged: $isAcknowledged, actionLink: $actionLink, entityId: $entityId)';
}


}

/// @nodoc
abstract mixin class $OpsNotificationCopyWith<$Res>  {
  factory $OpsNotificationCopyWith(OpsNotification value, $Res Function(OpsNotification) _then) = _$OpsNotificationCopyWithImpl;
@useResult
$Res call({
 String id, String title, String message, DateTime timestamp, String severity, bool isRead, bool isAcknowledged, String? actionLink, String? entityId
});




}
/// @nodoc
class _$OpsNotificationCopyWithImpl<$Res>
    implements $OpsNotificationCopyWith<$Res> {
  _$OpsNotificationCopyWithImpl(this._self, this._then);

  final OpsNotification _self;
  final $Res Function(OpsNotification) _then;

/// Create a copy of OpsNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? message = null,Object? timestamp = null,Object? severity = null,Object? isRead = null,Object? isAcknowledged = null,Object? actionLink = freezed,Object? entityId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isAcknowledged: null == isAcknowledged ? _self.isAcknowledged : isAcknowledged // ignore: cast_nullable_to_non_nullable
as bool,actionLink: freezed == actionLink ? _self.actionLink : actionLink // ignore: cast_nullable_to_non_nullable
as String?,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OpsNotification].
extension OpsNotificationPatterns on OpsNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpsNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpsNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpsNotification value)  $default,){
final _that = this;
switch (_that) {
case _OpsNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpsNotification value)?  $default,){
final _that = this;
switch (_that) {
case _OpsNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String message,  DateTime timestamp,  String severity,  bool isRead,  bool isAcknowledged,  String? actionLink,  String? entityId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpsNotification() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.timestamp,_that.severity,_that.isRead,_that.isAcknowledged,_that.actionLink,_that.entityId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String message,  DateTime timestamp,  String severity,  bool isRead,  bool isAcknowledged,  String? actionLink,  String? entityId)  $default,) {final _that = this;
switch (_that) {
case _OpsNotification():
return $default(_that.id,_that.title,_that.message,_that.timestamp,_that.severity,_that.isRead,_that.isAcknowledged,_that.actionLink,_that.entityId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String message,  DateTime timestamp,  String severity,  bool isRead,  bool isAcknowledged,  String? actionLink,  String? entityId)?  $default,) {final _that = this;
switch (_that) {
case _OpsNotification() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.timestamp,_that.severity,_that.isRead,_that.isAcknowledged,_that.actionLink,_that.entityId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpsNotification implements OpsNotification {
  const _OpsNotification({required this.id, required this.title, required this.message, required this.timestamp, required this.severity, this.isRead = false, this.isAcknowledged = false, this.actionLink, this.entityId});
  factory _OpsNotification.fromJson(Map<String, dynamic> json) => _$OpsNotificationFromJson(json);

@override final  String id;
@override final  String title;
@override final  String message;
@override final  DateTime timestamp;
@override final  String severity;
// 'info', 'warning', 'error', 'urgent'
@override@JsonKey() final  bool isRead;
@override@JsonKey() final  bool isAcknowledged;
@override final  String? actionLink;
@override final  String? entityId;

/// Create a copy of OpsNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpsNotificationCopyWith<_OpsNotification> get copyWith => __$OpsNotificationCopyWithImpl<_OpsNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpsNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpsNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isAcknowledged, isAcknowledged) || other.isAcknowledged == isAcknowledged)&&(identical(other.actionLink, actionLink) || other.actionLink == actionLink)&&(identical(other.entityId, entityId) || other.entityId == entityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,message,timestamp,severity,isRead,isAcknowledged,actionLink,entityId);

@override
String toString() {
  return 'OpsNotification(id: $id, title: $title, message: $message, timestamp: $timestamp, severity: $severity, isRead: $isRead, isAcknowledged: $isAcknowledged, actionLink: $actionLink, entityId: $entityId)';
}


}

/// @nodoc
abstract mixin class _$OpsNotificationCopyWith<$Res> implements $OpsNotificationCopyWith<$Res> {
  factory _$OpsNotificationCopyWith(_OpsNotification value, $Res Function(_OpsNotification) _then) = __$OpsNotificationCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String message, DateTime timestamp, String severity, bool isRead, bool isAcknowledged, String? actionLink, String? entityId
});




}
/// @nodoc
class __$OpsNotificationCopyWithImpl<$Res>
    implements _$OpsNotificationCopyWith<$Res> {
  __$OpsNotificationCopyWithImpl(this._self, this._then);

  final _OpsNotification _self;
  final $Res Function(_OpsNotification) _then;

/// Create a copy of OpsNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? message = null,Object? timestamp = null,Object? severity = null,Object? isRead = null,Object? isAcknowledged = null,Object? actionLink = freezed,Object? entityId = freezed,}) {
  return _then(_OpsNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isAcknowledged: null == isAcknowledged ? _self.isAcknowledged : isAcknowledged // ignore: cast_nullable_to_non_nullable
as bool,actionLink: freezed == actionLink ? _self.actionLink : actionLink // ignore: cast_nullable_to_non_nullable
as String?,entityId: freezed == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
