/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the BlogImages type in your schema. */
@immutable
class BlogImages extends Model {
  static const classType = const _BlogImagesModelType();
  final String id;
  final String imageKey;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const BlogImages._internal({@required this.id, this.imageKey});

  factory BlogImages({String id, String imageKey}) {
    return BlogImages._internal(
        id: id == null ? UUID.getUUID() : id, imageKey: imageKey);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BlogImages && id == other.id && imageKey == other.imageKey;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("BlogImages {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("imageKey=" + "$imageKey");
    buffer.write("}");

    return buffer.toString();
  }

  BlogImages copyWith({String id, String imageKey}) {
    return BlogImages(id: id ?? this.id, imageKey: imageKey ?? this.imageKey);
  }

  BlogImages.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageKey = json['imageKey'];

  Map<String, dynamic> toJson() => {'id': id, 'imageKey': imageKey};

  static final QueryField ID = QueryField(fieldName: "blogImages.id");
  static final QueryField IMAGEKEY = QueryField(fieldName: "imageKey");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "BlogImages";
    modelSchemaDefinition.pluralName = "BlogImages";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: BlogImages.IMAGEKEY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _BlogImagesModelType extends ModelType<BlogImages> {
  const _BlogImagesModelType();

  @override
  BlogImages fromJson(Map<String, dynamic> jsonData) {
    return BlogImages.fromJson(jsonData);
  }
}
