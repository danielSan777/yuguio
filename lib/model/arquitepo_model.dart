// To parse this JSON data, do
//
//     final arquitepoDto = arquitepoDtoFromJson(jsonString);

import 'dart:convert';

List<ArquitepoDto> arquitepoDtoFromJson(String str) => List<ArquitepoDto>.from(json.decode(str).map((x) => ArquitepoDto.fromJson(x)));

String arquitepoDtoToJson(List<ArquitepoDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArquitepoDto {
    String archetypeName;

    ArquitepoDto({
        required this.archetypeName,
    });

    factory ArquitepoDto.fromJson(Map<String, dynamic> json) => ArquitepoDto(
        archetypeName: json["archetype_name"],
    );

    Map<String, dynamic> toJson() => {
        "archetype_name": archetypeName,
    };
}
