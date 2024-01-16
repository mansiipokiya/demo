// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class control extends _control with RealmEntity, RealmObjectBase, RealmObject {
  control(
    String name,
  ) {
    RealmObjectBase.set(this, 'name', name);
  }

  control._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<control>> get changes =>
      RealmObjectBase.getChanges<control>(this);

  @override
  control freeze() => RealmObjectBase.freezeObject<control>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(control._);
    return const SchemaObject(ObjectType.realmObject, control, 'control', [
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }
}
