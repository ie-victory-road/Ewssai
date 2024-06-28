class Info{

  String? type;
  String? cate;
  String? precise;
  String? marque;
  String? what;
  String? id;
  String? more;
  String? why;
  String? risks;
  String? sanitaires;
  String? todo;
  String? gain;
  String? image;
  String? list;
  String? pdf;
  String? rappel;
  String? number;
  String? date;

//  int? limit; 

  Info({
    this.type,
    this.cate,
    this.precise,
    this.marque,
    this.what,
    this.id,
    this.more,
    this.why,
    this.risks,
    this.sanitaires,
    this.todo,
    this.gain,
    this.image,
    this.list,
    this.pdf,
    this.rappel,
    this.number,
    this.date,
   // this.limit,
  });

  Info.fromJson(dynamic json) {
    type = json['nature_juridique_du_rappel'] ?? "Inconnue";
    cate = json['categorie_de_produit'] ?? "OUPOUOPUOU"; 
    precise = json['sous_categorie_de_produit'] ?? "Litteraly something";
    marque = json['nom_de_la_marque_du_produit'] ?? "C'est Nike (en fait c'est pas vrai)";
    what = json['noms_des_modeles_ou_references'] ?? "Pas AABBDD";
    id = json['identification_des_produits'] ?? "Les truuuuucs laaaaa";
    more = json['informations_complementaires'] ?? "Y'a rien a voir"; 
    why = json['motif_du_rappel'] ?? "Parce que j'ai decide";
    risks = json['risques_encourus_par_le_consommateur'] ?? "Beaucoup de trucs dangereux";
    sanitaires = json['preconisations_sanitaires'] ?? "Lavez-vous les mains apres etre alle au toilettes";
    todo = json['conduites_a_tenir_par_le_consommateur'] ?? "Rammener tes chips la ou tu les a voles";
    gain = json['modalites_de_compensation'] ?? "Aucune idee demande directement la-bas";
    image = json['liens_vers_les_images'] ?? "https://rappel.conso.gouv.fr/image/0bb93050-c322-4e9b-9522-aabee86b2cb0.jpg";
    list = json['lien_vers_la_liste_des_produits'] ?? "https://data.economie.gouv.fr/api/explore/v2.1/catalog/datasets/rappelconso0/records?select=nature_juridique_du_rappel%2Ccategorie_de_produit%2Csous_categorie_de_produit%2Cnom_de_la_marque_du_produit%2Cnoms_des_modeles_ou_references%2Cidentification_des_produits%2Cinformations_complementaires%2Cmotif_du_rappel%2Crisques_encourus_par_le_consommateur%2Cpreconisations_sanitaires%2Cconduites_a_tenir_par_le_consommateur%2Cnumero_de_contact%2Cmodalites_de_compensation%2Cliens_vers_les_images%2Clien_vers_affichette_pdf%2Clien_vers_la_fiche_rappel%2Cdate_de_publication&order_by=date_de_publication%20desc&limit=20";
    pdf = json['lien_vers_affichette_pdf'] ?? "https://data.economie.gouv.fr/api/explore/v2.1/catalog/datasets/rappelconso0/records?select=nature_juridique_du_rappel%2Ccategorie_de_produit%2Csous_categorie_de_produit%2Cnom_de_la_marque_du_produit%2Cnoms_des_modeles_ou_references%2Cidentification_des_produits%2Cinformations_complementaires%2Cmotif_du_rappel%2Crisques_encourus_par_le_consommateur%2Cpreconisations_sanitaires%2Cconduites_a_tenir_par_le_consommateur%2Cnumero_de_contact%2Cmodalites_de_compensation%2Cliens_vers_les_images%2Clien_vers_affichette_pdf%2Clien_vers_la_fiche_rappel%2Cdate_de_publication&order_by=date_de_publication%20desc&limit=20";
    rappel = json['lien_vers_la_fiche_rappel'] ?? "https://data.economie.gouv.fr/api/explore/v2.1/catalog/datasets/rappelconso0/records?select=nature_juridique_du_rappel%2Ccategorie_de_produit%2Csous_categorie_de_produit%2Cnom_de_la_marque_du_produit%2Cnoms_des_modeles_ou_references%2Cidentification_des_produits%2Cinformations_complementaires%2Cmotif_du_rappel%2Crisques_encourus_par_le_consommateur%2Cpreconisations_sanitaires%2Cconduites_a_tenir_par_le_consommateur%2Cnumero_de_contact%2Cmodalites_de_compensation%2Cliens_vers_les_images%2Clien_vers_affichette_pdf%2Clien_vers_la_fiche_rappel%2Cdate_de_publication&order_by=date_de_publication%20desc&limit=20";
    number = json['numero_de_contact'] ?? "06 06 06 06 06 et si ca repond pas 07 07 07 07 07";
    date = json['date_de_publication'] ?? "La naissance de Messi";
    
    }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic> {};
    map['nature_juridique_du_rappel'] = type;
    map['categorie_du_produit'] = cate;
    map['sous_categorie_de_produit'] = precise;       
    map['nom_de_la_marque_du_produit'] = marque;
    map['nom_des_modeles_ou_references'] = what;
    map['identification_des_produits'] = id;
    map['informations_complementaires'] = more;
    map['motif_du_rappel'] = why;
    map['risques_encourus_par_le_consommateur'] = risks;
    map['preconisations_sanitaires'] = sanitaires;
    map['conduite_a_tenir_par_le_consommateur'] = todo;
    map['modalites_de_compensation'] = gain;
    map['lien_vers_les_images'] = image;
    map['lien_vers_la_liste_des_produits'] = list;
    map['lien_vers_affichette_pdf'] = pdf;
    map['lien_vers_fiche_rappel'] = rappel;
    map['numero_de_contact'] = number;
    map['date_de_publication'] = date;
    return map;
  }
}
