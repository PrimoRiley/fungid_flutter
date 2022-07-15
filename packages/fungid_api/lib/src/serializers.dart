//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:fungid_api/src/date_serializer.dart';
import 'package:fungid_api/src/model/date.dart';

import 'package:fungid_api/src/model/gbif_observation.dart';
import 'package:fungid_api/src/model/gbif_observation_image.dart';
import 'package:fungid_api/src/model/http_validation_error.dart';
import 'package:fungid_api/src/model/location_inner.dart';
import 'package:fungid_api/src/model/page_gbif_observation.dart';
import 'package:fungid_api/src/model/page_gbif_observation_image.dart';
import 'package:fungid_api/src/model/page_species.dart';
import 'package:fungid_api/src/model/species.dart';
import 'package:fungid_api/src/model/validation_error.dart';

part 'serializers.g.dart';

@SerializersFor([
  GbifObservation,
  GbifObservationImage,
  HTTPValidationError,
  LocationInner,
  PageGbifObservation,
  PageGbifObservationImage,
  PageSpecies,
  Species,
  ValidationError,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(num)]),
        () => MapBuilder<String, num>(),
      )
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
