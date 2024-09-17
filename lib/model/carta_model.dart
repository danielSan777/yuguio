import 'dart:convert';

CardResponse cardResponseFromJson(String str) => CardResponse.fromJson(json.decode(str));

String cardResponseToJson(CardResponse data) => json.encode(data.toJson());

class CardResponse{
    List<CardDTO> data;

    CardResponse({
        required this.data,
    });

    factory CardResponse.fromJson(Map<String, dynamic> json) => CardResponse(
        data: List<CardDTO>.from(json["data"].map((x) => CardDTO.fromJson(x))),
    );

    Map<String,dynamic>toJson()=>{
        "data":List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CardDTO{
    int id;
    String name;
    String typeline;
    String type;
    String humanReadableCardType;
    String frameType;
    String desc;
    String race;
    String? pendDesc;
    String? monsterDesc;
    int atk;
    int def;
    int level;
    String attribute;
    String archetype;
    int? scale;
    String ygoprodeckUrl;
    List<CardSet> cardSets;
    List<CardImage> cardImages;
    List<CardPrice> cardPrices;
   
   CardDTO({
        required this.id,
        required this.name,
        required this.typeline,
        required this.type,
        required this.humanReadableCardType,
        required this.frameType,
        required this.desc,
        required this.race,
        this.pendDesc,
        this.monsterDesc,
        required this.atk,
        required this.def,
        required this.level,
        required this.attribute,
        required this.archetype,
        this.scale,
        required this.ygoprodeckUrl,
        required this.cardSets,
        required this.cardImages,
        required this.cardPrices,
    });
    
    factory CardDTO.fromJson(Map<String, dynamic> json) =>CardDTO(
        id: json["id"],
        name: json["name"],
        typeline:json["typeline"],
        type: json["type"],
        humanReadableCardType: json["humanReadableCardType"],
        frameType: json["frameType"],
        desc: json["desc"],
        race:json["race"],
        pendDesc: json["pend_desc"],
        monsterDesc: json["monster_desc"],
        atk: json["atk"],
        def: json["def"],
        level: json["level"],
        attribute:json["attribute"],
        archetype:json["archetype"],
        scale: json["scale"],
        ygoprodeckUrl: json["ygoprodeck_url"],
        cardSets: List<CardSet>.from(json["card_sets"].map((x) => CardSet.fromJson(x))),
        cardImages: List<CardImage>.from(json["card_images"].map((x) => CardImage.fromJson(x))),
        cardPrices: List<CardPrice>.from(json["card_prices"].map((x) => CardPrice.fromJson(x))),
    );
    
    Map<String,dynamic>toJson()=>{
        "id": id,
        "name":name,
        "typeline":typeline,
        "type":type,
        "humanReadableCardType":humanReadableCardType,
        "frameType":frameType,
        "desc":desc,
        "race":race,
        "pend_desc":pendDesc,
        "monster_desc":monsterDesc,
        "atk":atk,
        "def":def,
        "level":level,
        "attribute":attribute,
        "archetype":archetype,
        "scale":scale,
        "ygoprodeck_url":ygoprodeckUrl,
        "card_sets":List<dynamic>.from(cardSets.map((x) => x.toJson())),
        "card_images":List<dynamic>.from(cardImages.map((x) => x.toJson())),
        "card_prices":List<dynamic>.from(cardPrices.map((x) => x.toJson())),
    };
}


class CardImage {
    int id;
    String imageUrl;
    String imageUrlSmall;
    String imageUrlCropped;

    CardImage({
        required this.id,
        required this.imageUrl,
        required this.imageUrlSmall,
        required this.imageUrlCropped,
    });

    factory CardImage.fromJson(Map<String, dynamic> json) => CardImage(
        id: json["id"],
        imageUrl: json["image_url"],
        imageUrlSmall: json["image_url_small"],
        imageUrlCropped: json["image_url_cropped"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "image_url_small": imageUrlSmall,
        "image_url_cropped": imageUrlCropped,
    };
}

class CardPrice {
    String cardmarketPrice;
    String tcgplayerPrice;
    String ebayPrice;
    String amazonPrice;
    String coolstuffincPrice;

    CardPrice({
        required this.cardmarketPrice,
        required this.tcgplayerPrice,
        required this.ebayPrice,
        required this.amazonPrice,
        required this.coolstuffincPrice,
    });

    factory CardPrice.fromJson(Map<String, dynamic> json) => CardPrice(
        cardmarketPrice: json["cardmarket_price"],
        tcgplayerPrice: json["tcgplayer_price"],
        ebayPrice: json["ebay_price"],
        amazonPrice: json["amazon_price"],
        coolstuffincPrice: json["coolstuffinc_price"],
    );

    Map<String, dynamic> toJson() => {
        "cardmarket_price": cardmarketPrice,
        "tcgplayer_price": tcgplayerPrice,
        "ebay_price": ebayPrice,
        "amazon_price": amazonPrice,
        "coolstuffinc_price": coolstuffincPrice,
    };
}

class CardSet {
    String setName;
    String setCode;
    String setRarity;
    String setRarityCode;
    String setPrice;

    CardSet({
        required this.setName,
        required this.setCode,
        required this.setRarity,
        required this.setRarityCode,
        required this.setPrice,
    });

    factory CardSet.fromJson(Map<String, dynamic> json) => CardSet(
        setName: json["set_name"],
        setCode: json["set_code"],
        setRarity: json["set_rarity"],
        setRarityCode: json["set_rarity_code"],
        setPrice: json["set_price"],
    );

    Map<String, dynamic> toJson() => {
        "set_name": setName,
        "set_code": setCode,
        "set_rarity": setRarity,
        "set_rarity_code": setRarityCode,
        "set_price": setPrice,
    };
}



