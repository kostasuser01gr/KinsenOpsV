// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vehicle {

 String get id; String get plate; String get model; VehicleStatus get status; DateTime get lastStatusUpdate; double get fuelLevel;// 0.0 to 1.0
 int get mileage; String? get currentDriver; String? get assignedWasherId; List<String> get damagePhotos; Map<String, dynamic> get metadata;
/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleCopyWith<Vehicle> get copyWith => _$VehicleCopyWithImpl<Vehicle>(this as Vehicle, _$identity);

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.plate, plate) || other.plate == plate)&&(identical(other.model, model) || other.model == model)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastStatusUpdate, lastStatusUpdate) || other.lastStatusUpdate == lastStatusUpdate)&&(identical(other.fuelLevel, fuelLevel) || other.fuelLevel == fuelLevel)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.currentDriver, currentDriver) || other.currentDriver == currentDriver)&&(identical(other.assignedWasherId, assignedWasherId) || other.assignedWasherId == assignedWasherId)&&const DeepCollectionEquality().equals(other.damagePhotos, damagePhotos)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,plate,model,status,lastStatusUpdate,fuelLevel,mileage,currentDriver,assignedWasherId,const DeepCollectionEquality().hash(damagePhotos),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'Vehicle(id: $id, plate: $plate, model: $model, status: $status, lastStatusUpdate: $lastStatusUpdate, fuelLevel: $fuelLevel, mileage: $mileage, currentDriver: $currentDriver, assignedWasherId: $assignedWasherId, damagePhotos: $damagePhotos, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $VehicleCopyWith<$Res>  {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) _then) = _$VehicleCopyWithImpl;
@useResult
$Res call({
 String id, String plate, String model, VehicleStatus status, DateTime lastStatusUpdate, double fuelLevel, int mileage, String? currentDriver, String? assignedWasherId, List<String> damagePhotos, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$VehicleCopyWithImpl<$Res>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._self, this._then);

  final Vehicle _self;
  final $Res Function(Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? plate = null,Object? model = null,Object? status = null,Object? lastStatusUpdate = null,Object? fuelLevel = null,Object? mileage = null,Object? currentDriver = freezed,Object? assignedWasherId = freezed,Object? damagePhotos = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,plate: null == plate ? _self.plate : plate // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VehicleStatus,lastStatusUpdate: null == lastStatusUpdate ? _self.lastStatusUpdate : lastStatusUpdate // ignore: cast_nullable_to_non_nullable
as DateTime,fuelLevel: null == fuelLevel ? _self.fuelLevel : fuelLevel // ignore: cast_nullable_to_non_nullable
as double,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as int,currentDriver: freezed == currentDriver ? _self.currentDriver : currentDriver // ignore: cast_nullable_to_non_nullable
as String?,assignedWasherId: freezed == assignedWasherId ? _self.assignedWasherId : assignedWasherId // ignore: cast_nullable_to_non_nullable
as String?,damagePhotos: null == damagePhotos ? _self.damagePhotos : damagePhotos // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [Vehicle].
extension VehiclePatterns on Vehicle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vehicle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vehicle value)  $default,){
final _that = this;
switch (_that) {
case _Vehicle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vehicle value)?  $default,){
final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String plate,  String model,  VehicleStatus status,  DateTime lastStatusUpdate,  double fuelLevel,  int mileage,  String? currentDriver,  String? assignedWasherId,  List<String> damagePhotos,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.plate,_that.model,_that.status,_that.lastStatusUpdate,_that.fuelLevel,_that.mileage,_that.currentDriver,_that.assignedWasherId,_that.damagePhotos,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String plate,  String model,  VehicleStatus status,  DateTime lastStatusUpdate,  double fuelLevel,  int mileage,  String? currentDriver,  String? assignedWasherId,  List<String> damagePhotos,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _Vehicle():
return $default(_that.id,_that.plate,_that.model,_that.status,_that.lastStatusUpdate,_that.fuelLevel,_that.mileage,_that.currentDriver,_that.assignedWasherId,_that.damagePhotos,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String plate,  String model,  VehicleStatus status,  DateTime lastStatusUpdate,  double fuelLevel,  int mileage,  String? currentDriver,  String? assignedWasherId,  List<String> damagePhotos,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _Vehicle() when $default != null:
return $default(_that.id,_that.plate,_that.model,_that.status,_that.lastStatusUpdate,_that.fuelLevel,_that.mileage,_that.currentDriver,_that.assignedWasherId,_that.damagePhotos,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vehicle implements Vehicle {
  const _Vehicle({required this.id, required this.plate, required this.model, required this.status, required this.lastStatusUpdate, required this.fuelLevel, required this.mileage, this.currentDriver, this.assignedWasherId, final  List<String> damagePhotos = const [], final  Map<String, dynamic> metadata = const {}}): _damagePhotos = damagePhotos,_metadata = metadata;
  factory _Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);

@override final  String id;
@override final  String plate;
@override final  String model;
@override final  VehicleStatus status;
@override final  DateTime lastStatusUpdate;
@override final  double fuelLevel;
// 0.0 to 1.0
@override final  int mileage;
@override final  String? currentDriver;
@override final  String? assignedWasherId;
 final  List<String> _damagePhotos;
@override@JsonKey() List<String> get damagePhotos {
  if (_damagePhotos is EqualUnmodifiableListView) return _damagePhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_damagePhotos);
}

 final  Map<String, dynamic> _metadata;
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleCopyWith<_Vehicle> get copyWith => __$VehicleCopyWithImpl<_Vehicle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vehicle&&(identical(other.id, id) || other.id == id)&&(identical(other.plate, plate) || other.plate == plate)&&(identical(other.model, model) || other.model == model)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastStatusUpdate, lastStatusUpdate) || other.lastStatusUpdate == lastStatusUpdate)&&(identical(other.fuelLevel, fuelLevel) || other.fuelLevel == fuelLevel)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.currentDriver, currentDriver) || other.currentDriver == currentDriver)&&(identical(other.assignedWasherId, assignedWasherId) || other.assignedWasherId == assignedWasherId)&&const DeepCollectionEquality().equals(other._damagePhotos, _damagePhotos)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,plate,model,status,lastStatusUpdate,fuelLevel,mileage,currentDriver,assignedWasherId,const DeepCollectionEquality().hash(_damagePhotos),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'Vehicle(id: $id, plate: $plate, model: $model, status: $status, lastStatusUpdate: $lastStatusUpdate, fuelLevel: $fuelLevel, mileage: $mileage, currentDriver: $currentDriver, assignedWasherId: $assignedWasherId, damagePhotos: $damagePhotos, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$VehicleCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$VehicleCopyWith(_Vehicle value, $Res Function(_Vehicle) _then) = __$VehicleCopyWithImpl;
@override @useResult
$Res call({
 String id, String plate, String model, VehicleStatus status, DateTime lastStatusUpdate, double fuelLevel, int mileage, String? currentDriver, String? assignedWasherId, List<String> damagePhotos, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$VehicleCopyWithImpl<$Res>
    implements _$VehicleCopyWith<$Res> {
  __$VehicleCopyWithImpl(this._self, this._then);

  final _Vehicle _self;
  final $Res Function(_Vehicle) _then;

/// Create a copy of Vehicle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? plate = null,Object? model = null,Object? status = null,Object? lastStatusUpdate = null,Object? fuelLevel = null,Object? mileage = null,Object? currentDriver = freezed,Object? assignedWasherId = freezed,Object? damagePhotos = null,Object? metadata = null,}) {
  return _then(_Vehicle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,plate: null == plate ? _self.plate : plate // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VehicleStatus,lastStatusUpdate: null == lastStatusUpdate ? _self.lastStatusUpdate : lastStatusUpdate // ignore: cast_nullable_to_non_nullable
as DateTime,fuelLevel: null == fuelLevel ? _self.fuelLevel : fuelLevel // ignore: cast_nullable_to_non_nullable
as double,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as int,currentDriver: freezed == currentDriver ? _self.currentDriver : currentDriver // ignore: cast_nullable_to_non_nullable
as String?,assignedWasherId: freezed == assignedWasherId ? _self.assignedWasherId : assignedWasherId // ignore: cast_nullable_to_non_nullable
as String?,damagePhotos: null == damagePhotos ? _self._damagePhotos : damagePhotos // ignore: cast_nullable_to_non_nullable
as List<String>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$WashTask {

 String get id; String get vehicleId; String get washerId; WashPreset get preset; DateTime get createdAt; DateTime? get startedAt; DateTime? get finishedAt; bool get isQcPassed; String? get qcNotes; String? get reworkReason;
/// Create a copy of WashTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WashTaskCopyWith<WashTask> get copyWith => _$WashTaskCopyWithImpl<WashTask>(this as WashTask, _$identity);

  /// Serializes this WashTask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WashTask&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.washerId, washerId) || other.washerId == washerId)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.isQcPassed, isQcPassed) || other.isQcPassed == isQcPassed)&&(identical(other.qcNotes, qcNotes) || other.qcNotes == qcNotes)&&(identical(other.reworkReason, reworkReason) || other.reworkReason == reworkReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleId,washerId,preset,createdAt,startedAt,finishedAt,isQcPassed,qcNotes,reworkReason);

@override
String toString() {
  return 'WashTask(id: $id, vehicleId: $vehicleId, washerId: $washerId, preset: $preset, createdAt: $createdAt, startedAt: $startedAt, finishedAt: $finishedAt, isQcPassed: $isQcPassed, qcNotes: $qcNotes, reworkReason: $reworkReason)';
}


}

/// @nodoc
abstract mixin class $WashTaskCopyWith<$Res>  {
  factory $WashTaskCopyWith(WashTask value, $Res Function(WashTask) _then) = _$WashTaskCopyWithImpl;
@useResult
$Res call({
 String id, String vehicleId, String washerId, WashPreset preset, DateTime createdAt, DateTime? startedAt, DateTime? finishedAt, bool isQcPassed, String? qcNotes, String? reworkReason
});




}
/// @nodoc
class _$WashTaskCopyWithImpl<$Res>
    implements $WashTaskCopyWith<$Res> {
  _$WashTaskCopyWithImpl(this._self, this._then);

  final WashTask _self;
  final $Res Function(WashTask) _then;

/// Create a copy of WashTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleId = null,Object? washerId = null,Object? preset = null,Object? createdAt = null,Object? startedAt = freezed,Object? finishedAt = freezed,Object? isQcPassed = null,Object? qcNotes = freezed,Object? reworkReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,washerId: null == washerId ? _self.washerId : washerId // ignore: cast_nullable_to_non_nullable
as String,preset: null == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as WashPreset,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isQcPassed: null == isQcPassed ? _self.isQcPassed : isQcPassed // ignore: cast_nullable_to_non_nullable
as bool,qcNotes: freezed == qcNotes ? _self.qcNotes : qcNotes // ignore: cast_nullable_to_non_nullable
as String?,reworkReason: freezed == reworkReason ? _self.reworkReason : reworkReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WashTask].
extension WashTaskPatterns on WashTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WashTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WashTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WashTask value)  $default,){
final _that = this;
switch (_that) {
case _WashTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WashTask value)?  $default,){
final _that = this;
switch (_that) {
case _WashTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String vehicleId,  String washerId,  WashPreset preset,  DateTime createdAt,  DateTime? startedAt,  DateTime? finishedAt,  bool isQcPassed,  String? qcNotes,  String? reworkReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WashTask() when $default != null:
return $default(_that.id,_that.vehicleId,_that.washerId,_that.preset,_that.createdAt,_that.startedAt,_that.finishedAt,_that.isQcPassed,_that.qcNotes,_that.reworkReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String vehicleId,  String washerId,  WashPreset preset,  DateTime createdAt,  DateTime? startedAt,  DateTime? finishedAt,  bool isQcPassed,  String? qcNotes,  String? reworkReason)  $default,) {final _that = this;
switch (_that) {
case _WashTask():
return $default(_that.id,_that.vehicleId,_that.washerId,_that.preset,_that.createdAt,_that.startedAt,_that.finishedAt,_that.isQcPassed,_that.qcNotes,_that.reworkReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String vehicleId,  String washerId,  WashPreset preset,  DateTime createdAt,  DateTime? startedAt,  DateTime? finishedAt,  bool isQcPassed,  String? qcNotes,  String? reworkReason)?  $default,) {final _that = this;
switch (_that) {
case _WashTask() when $default != null:
return $default(_that.id,_that.vehicleId,_that.washerId,_that.preset,_that.createdAt,_that.startedAt,_that.finishedAt,_that.isQcPassed,_that.qcNotes,_that.reworkReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WashTask implements WashTask {
  const _WashTask({required this.id, required this.vehicleId, required this.washerId, required this.preset, required this.createdAt, this.startedAt, this.finishedAt, this.isQcPassed = false, this.qcNotes, this.reworkReason});
  factory _WashTask.fromJson(Map<String, dynamic> json) => _$WashTaskFromJson(json);

@override final  String id;
@override final  String vehicleId;
@override final  String washerId;
@override final  WashPreset preset;
@override final  DateTime createdAt;
@override final  DateTime? startedAt;
@override final  DateTime? finishedAt;
@override@JsonKey() final  bool isQcPassed;
@override final  String? qcNotes;
@override final  String? reworkReason;

/// Create a copy of WashTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WashTaskCopyWith<_WashTask> get copyWith => __$WashTaskCopyWithImpl<_WashTask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WashTaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WashTask&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.washerId, washerId) || other.washerId == washerId)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.isQcPassed, isQcPassed) || other.isQcPassed == isQcPassed)&&(identical(other.qcNotes, qcNotes) || other.qcNotes == qcNotes)&&(identical(other.reworkReason, reworkReason) || other.reworkReason == reworkReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleId,washerId,preset,createdAt,startedAt,finishedAt,isQcPassed,qcNotes,reworkReason);

@override
String toString() {
  return 'WashTask(id: $id, vehicleId: $vehicleId, washerId: $washerId, preset: $preset, createdAt: $createdAt, startedAt: $startedAt, finishedAt: $finishedAt, isQcPassed: $isQcPassed, qcNotes: $qcNotes, reworkReason: $reworkReason)';
}


}

/// @nodoc
abstract mixin class _$WashTaskCopyWith<$Res> implements $WashTaskCopyWith<$Res> {
  factory _$WashTaskCopyWith(_WashTask value, $Res Function(_WashTask) _then) = __$WashTaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String vehicleId, String washerId, WashPreset preset, DateTime createdAt, DateTime? startedAt, DateTime? finishedAt, bool isQcPassed, String? qcNotes, String? reworkReason
});




}
/// @nodoc
class __$WashTaskCopyWithImpl<$Res>
    implements _$WashTaskCopyWith<$Res> {
  __$WashTaskCopyWithImpl(this._self, this._then);

  final _WashTask _self;
  final $Res Function(_WashTask) _then;

/// Create a copy of WashTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleId = null,Object? washerId = null,Object? preset = null,Object? createdAt = null,Object? startedAt = freezed,Object? finishedAt = freezed,Object? isQcPassed = null,Object? qcNotes = freezed,Object? reworkReason = freezed,}) {
  return _then(_WashTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,washerId: null == washerId ? _self.washerId : washerId // ignore: cast_nullable_to_non_nullable
as String,preset: null == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as WashPreset,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isQcPassed: null == isQcPassed ? _self.isQcPassed : isQcPassed // ignore: cast_nullable_to_non_nullable
as bool,qcNotes: freezed == qcNotes ? _self.qcNotes : qcNotes // ignore: cast_nullable_to_non_nullable
as String?,reworkReason: freezed == reworkReason ? _self.reworkReason : reworkReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
