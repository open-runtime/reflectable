// Copyright (c) 2015, the Dart Team. All rights reserved. Use of this
// source code is governed by a BSD-style license that can be found in
// the LICENSE file.

library reflectable.src.element_capability;

// This library provides a variant of the `ReflectCapability` class
// hierarchy from `../capability.dart` which is suitable for holding
// information about entities in a target program at analysis time,
// rather than holding runtime entities. This is necessary because
// the transformer needs to deal with analysis time descriptions of
// objects and types that cannot exist in the transformer itself,
// because the transformer does not contain or import the same
// libraries as the target program does.
//
// For documentation of each of these classes and const values, please
// search the declaration with the same name in `../capability.dart`.
//
// NB! It is crucial that all changes in '../capabilities.dart' are
// performed in the corresponding manner here, and vice versa.

import 'package:analyzer/src/generated/element.dart';

abstract class ReflectCapability {
  const ReflectCapability();
}

abstract class ApiReflectCapability implements ReflectCapability {
  const ApiReflectCapability();
}

abstract class NamePatternCapability implements ApiReflectCapability {
  final String namePattern;
  const NamePatternCapability(this.namePattern);
}

abstract class MetadataQuantifiedCapability implements ApiReflectCapability {
  final ClassElement metadataType;
  const MetadataQuantifiedCapability(this.metadataType);
}

class InstanceInvokeCapability extends NamePatternCapability {
  const InstanceInvokeCapability(String namePattern) : super(namePattern);
}

const instanceInvokeCapability = const InstanceInvokeCapability("");

class InstanceInvokeMetaCapability extends MetadataQuantifiedCapability {
  const InstanceInvokeMetaCapability(ClassElement metadataType)
      : super(metadataType);
}

class StaticInvokeCapability extends NamePatternCapability {
  const StaticInvokeCapability(String namePattern) : super(namePattern);
}

const staticInvokeCapability = const StaticInvokeCapability("");

class StaticInvokeMetaCapability extends MetadataQuantifiedCapability {
  const StaticInvokeMetaCapability(ClassElement metadataType)
      : super(metadataType);
}

class TopLevelInvokeCapability extends NamePatternCapability {
  const TopLevelInvokeCapability(String namePattern) : super(namePattern);
}

class TopLevelInvokeMetaCapability extends MetadataQuantifiedCapability {
  const TopLevelInvokeMetaCapability(ClassElement metadataType)
  : super(metadataType);
}

class NewInstanceCapability extends NamePatternCapability {
  const NewInstanceCapability(String namePattern) : super(namePattern);
}

const newInstanceCapability = const NewInstanceCapability("");

class NewInstanceMetaCapability extends MetadataQuantifiedCapability {
  const NewInstanceMetaCapability(ClassElement metadataType)
      : super(metadataType);
}

const nameCapability = const _NameCapability();

const classifyCapability = const _ClassifyCapability();

const metadataCapability = const _MetadataCapability();

class TypeCapability implements ApiReflectCapability {
  final Element upperBound;
  const TypeCapability(this.upperBound);
}

// TODO(eernst) implement: Obtain an Element representing the class Object.
const typeCapability = const TypeCapability(null /* should ~ Object! */);

const localTypeCapability = const TypeCapability(null);

const typeRelationsCapability = const _TypeRelationsCapability();

const libraryCapability = const _LibraryCapability();

const declarationsCapability = const _DeclarationsCapability();

const uriCapability = const _UriCapability();

const libraryDependenciesCapability = const _LibraryDependenciesCapability();

class InvokingCapability extends NamePatternCapability
    implements
        InstanceInvokeCapability,
        StaticInvokeCapability,
        NewInstanceCapability {
  const InvokingCapability(String namePattern) : super(namePattern);
}

const invokingCapability = const InvokingCapability("");

class InvokingMetaCapability extends MetadataQuantifiedCapability
    implements
        InstanceInvokeMetaCapability,
        StaticInvokeMetaCapability,
        NewInstanceMetaCapability {
  const InvokingMetaCapability(ClassElement metadataType) : super(metadataType);
}

class TypingCapability extends TypeCapability
    implements
        _NameCapability,
        _ClassifyCapability,
        _MetadataCapability,
        _TypeRelationsCapability,
        _DeclarationsCapability,
        _UriCapability,
        _LibraryDependenciesCapability {
  const TypingCapability(Element upperBound) : super(upperBound);
}

abstract class ReflecteeQuantifyCapability implements ReflectCapability {
  const ReflecteeQuantifyCapability();
}

const subtypeQuantifyCapability = const _SubtypeQuantifyCapability();

const admitSubtypeCapability = const _AdmitSubtypeCapability();

class ImportAttachedCapability {
  final Element reflector;
  const ImportAttachedCapability(this.reflector);
}

class GlobalQuantifyCapability extends ImportAttachedCapability {
  final String classNamePattern;
  const GlobalQuantifyCapability(this.classNamePattern, Element reflector)
      : super(reflector);
}

class GlobalQuantifyMetaCapability extends ImportAttachedCapability {
  final Element metadataType;
  const GlobalQuantifyMetaCapability(this.metadataType, Element reflector)
      : super(reflector);
}

class _NameCapability implements ApiReflectCapability {
  const _NameCapability();
}

class _ClassifyCapability implements ApiReflectCapability {
  const _ClassifyCapability();
}

class _MetadataCapability implements ApiReflectCapability {
  const _MetadataCapability();
}

class _TypeRelationsCapability implements ApiReflectCapability {
  const _TypeRelationsCapability();
}

class _LibraryCapability implements ApiReflectCapability {
  const _LibraryCapability();
}

class _DeclarationsCapability implements ApiReflectCapability {
  const _DeclarationsCapability();
}

class _UriCapability implements ApiReflectCapability {
  const _UriCapability();
}

class _LibraryDependenciesCapability implements ApiReflectCapability {
  const _LibraryDependenciesCapability();
}

class _SubtypeQuantifyCapability implements ReflecteeQuantifyCapability {
  const _SubtypeQuantifyCapability();
}

class _AdmitSubtypeCapability implements ReflecteeQuantifyCapability {
  const _AdmitSubtypeCapability();
}
