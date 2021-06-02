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

/** This is an auto generated class representing the Products type in your schema. */
@immutable
class Products extends Model {
  static const classType = const _ProductsModelType();
  final String id;
  final String name;
  final String description;
  final String category;
  final String country;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Products._internal(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.category,
      @required this.country});

  factory Products(
      {String id,
      @required String name,
      @required String description,
      @required String category,
      @required String country}) {
    return Products._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        description: description,
        category: category,
        country: country);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Products &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        category == other.category &&
        country == other.country;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Products {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("description=" + "$description" + ", ");
    buffer.write("category=" + "$category" + ", ");
    buffer.write("country=" + "$country");
    buffer.write("}");

    return buffer.toString();
  }

  Products copyWith(
      {String id,
      String name,
      String description,
      String category,
      String country}) {
    return Products(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        category: category ?? this.category,
        country: country ?? this.country);
  }

  Products.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        category = json['category'],
        country = json['country'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'category': category,
        'country': country
      };

  static final QueryField ID = QueryField(fieldName: "products.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Products";
    modelSchemaDefinition.pluralName = "Products";

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
        key: Products.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Products.DESCRIPTION,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Products.CATEGORY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Products.COUNTRY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _ProductsModelType extends ModelType<Products> {
  const _ProductsModelType();

  @override
  Products fromJson(Map<String, dynamic> jsonData) {
    return Products.fromJson(jsonData);
  }
}
