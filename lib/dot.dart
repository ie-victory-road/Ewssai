class Info{

  String? type;
  String? cate;
  String? image;

  Info({
    this.type,
    this.cate,
    this.image,
  });

  Info.fromJson(dynamic json) {
    type = json['natur_juridique_du_rappel'];
    cate = json['categorie_du_produit']; 
    image = json['lien_vers_les_images'];    
  }

  Map<String, Object> toJson() {
    final map = <String, Object> {};
    map['natur_juridique_du_rappel'] = type!;
    map['categorie_du_produit'] = cate!;
    map['lien_vers_les_images'] = image!;
    return map;
  }
}