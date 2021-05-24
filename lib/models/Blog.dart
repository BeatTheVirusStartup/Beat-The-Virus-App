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

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Blog type in your schema. */
@immutable
class Blog extends Model {
  static const classType = const _BlogModelType();
  final String id;
  final String title;
  final String content;
  final int views;
  final String imageKey;
  final BlogImages BlogToBlogImage;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Blog._internal(
      {@required this.id,
      @required this.title,
      @required this.content,
      this.views,
      @required this.imageKey,
      this.BlogToBlogImage});

  factory Blog(
      {String id,
      @required String title,
      @required String content,
      int views,
      @required String imageKey,
      BlogImages BlogToBlogImage}) {
    return Blog._internal(
        id: id == null ? UUID.getUUID() : id,
        title: title,
        content: content,
        views: views,
        imageKey: imageKey,
        BlogToBlogImage: BlogToBlogImage);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Blog &&
        id == other.id &&
        title == other.title &&
        content == other.content &&
        views == other.views &&
        imageKey == other.imageKey &&
        BlogToBlogImage == other.BlogToBlogImage;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Blog {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$title" + ", ");
    buffer.write("content=" + "$content" + ", ");
    buffer.write("views=" + (views != null ? views.toString() : "null") + ", ");
    buffer.write("imageKey=" + "$imageKey" + ", ");
    buffer.write("BlogToBlogImage=" +
        (BlogToBlogImage != null ? BlogToBlogImage.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Blog copyWith(
      {String id,
      String title,
      String content,
      int views,
      String imageKey,
      BlogImages BlogToBlogImage}) {
    return Blog(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        views: views ?? this.views,
        imageKey: imageKey ?? this.imageKey,
        BlogToBlogImage: BlogToBlogImage ?? this.BlogToBlogImage);
  }

  Blog.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        content = json['content'],
        views = json['views'],
        imageKey = json['imageKey'],
        BlogToBlogImage = json['BlogToBlogImage'] != null
            ? BlogImages.fromJson(
                new Map<String, dynamic>.from(json['BlogToBlogImage']))
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'views': views,
        'imageKey': imageKey,
        'BlogToBlogImage': BlogToBlogImage?.toJson()
      };

  static final QueryField ID = QueryField(fieldName: "blog.id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField CONTENT = QueryField(fieldName: "content");
  static final QueryField VIEWS = QueryField(fieldName: "views");
  static final QueryField IMAGEKEY = QueryField(fieldName: "imageKey");
  static final QueryField BLOGTOBLOGIMAGE = QueryField(
      fieldName: "BlogToBlogImage",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (BlogImages).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Blog";
    modelSchemaDefinition.pluralName = "Blogs";

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
        key: Blog.TITLE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Blog.CONTENT,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Blog.VIEWS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Blog.IMAGEKEY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Blog.BLOGTOBLOGIMAGE,
        isRequired: false,
        targetName: "blogBlogToBlogImageId",
        ofModelName: (BlogImages).toString()));
  });
}

class _BlogModelType extends ModelType<Blog> {
  const _BlogModelType();

  @override
  Blog fromJson(Map<String, dynamic> jsonData) {
    return Blog.fromJson(jsonData);
  }
}
