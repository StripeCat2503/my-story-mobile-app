class Block {
  int id;
  String? blockType;
  String? text;
  String? image;
  int order;

  Block({this.id = 0, this.blockType, this.text, this.image, this.order = 0});

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
        id: json['id'],
        blockType: json['blockType'],
        text: json['text'],
        image: json['image'],
        order: json['order']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'blockType': blockType,
      'text': text,
      'image': image,
      'order': order,
    };
  }
}
