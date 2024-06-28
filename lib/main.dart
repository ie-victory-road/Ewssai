import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://data.economie.gouv.fr/api/explore/v2.1/catalog/datasets/rappelconso0/records?select=nature_juridique_du_rappel%2Ccategorie_de_produit%2Csous_categorie_de_produit%2Cnom_de_la_marque_du_produit%2Cnoms_des_modeles_ou_references%2Cidentification_des_produits%2Cinformations_complementaires%2Cmotif_du_rappel%2Crisques_encourus_par_le_consommateur%2Cpreconisations_sanitaires%2Cconduites_a_tenir_par_le_consommateur%2Cnumero_de_contact%2Cmodalites_de_compensation%2Cliens_vers_les_images%2Clien_vers_affichette_pdf%2Clien_vers_la_fiche_rappel%2Cdate_de_publication&order_by=date_de_publication%20desc&limit=20'));
}

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
/* class Test {
  Test({required this.name, required this.cuisine, this.yearOpened});
  final String name;
  final String cuisine;
  final int? yearOpened;
  factory Test.fromJson(Map<String, dynamic> donner){
     if (donner
        case {
          'name': String name,
          'cuisine': String cuisine,
        }) {
           final yearOpened = donner['year_opened'] as int?;
      return Test(name: name, cuisine: cuisine, yearOpened: yearOpened);
    } else {
      throw FormatException('Invalid JSON: $donner');
    }
  }
}   */


void main() {
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Figma App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
 class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
   /* List<Info> items =[];

  var info1 = Info(image:"https://rappel.conso.gouv.fr/image/e16326b8-059b-4a61-817d-2bd30ef46c4b.jpg", type: "Thon", cate: "PK", what: "ks", precise: "more", risks: "sanit", sanitaires: "dhs", more: "dfe");
  items.add(info1);
  var a = info1;
  var b = Info(image:"https://rappel.conso.gouv.fr/image/e16326b8-059b-4a61-817d-2bd30ef46c4b.jpg", type: "Thon", what: "AIGUILLETTE POULET CORNFLAKE  vendu sur le stand traditionnel rôtissoire de Carrefour CLUSES DU 10 AU 17 JUIN 2024", cate: "Alimentation", precise: "Plats", more: "AIGUILLETTE POULET CORFLAKE vendu sur le stand traditionnel rôtissoire de Carrefour  CLUSES DU 10 AU 17 JUIN 2024", risks: "C'est dangereux", sanitaires: "Faut mettre le masque");
  var c = b;
  items.add(a);
  items.add(b);
  items.add(c); */

  Future<List<Info>> fetchData() async {
        var response = await fetchAlbum();
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        var itemData = jsonData["results"] as List<dynamic>;
        return itemData.map((data) => Info.fromJson(data)).toList();
      }
      else {
        throw Exception("erreur");
      }
  }
 return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Les plus récents',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Info>>(
                future: fetchData(),
                  builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return const CircularProgressIndicator();
                  }
                 else if (snapshot.hasError) {
                return Text('${snapshot.error}');
                  }

                  else if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OurApp(post: post)),
            );
          },
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl : post.image!,
                                  width: 85,
                                  height: 85,
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Produit',
                                       style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      post.cate!,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Raison du retrait',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    post.type == "Volontaire (sans arrêté préfectoral)" ? const Text(
                                      "Volontaire",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ) : Text(
                                      post.type!,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                      }
                      );
                    } 
 
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data![index];
                        return Card(
                        margin: const EdgeInsets.only(bottom: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl : post.image!,
                                width: 85,
                                height: 85,
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Produit',
                                     style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    post.cate!,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Raison du retrait',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    post.type!,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                       );
                      }
                    );
                  }//data.hasdata   
            )
            ),
          ],
        ),
      ),
    );
  }
}

  class OurApp extends StatelessWidget {
    final Info post;

    const OurApp({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductDetailPage(post: post),
    );
  }
}

class ProductDetailPage extends StatelessWidget {

  final Info post;

  const ProductDetailPage({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    
      String url = post.rappel!;

  void launchURL() async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }
    return Scaffold(
      appBar: AppBar(
        title: Text(post.cate!),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            );// Handle back button press
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: post.image!,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Modèles/Références : ${post.what!}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Nature juridique du rappel : ${post.type!}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sous-catégorie : ${post.precise!}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Informations complémentaires : ${post.more!}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Risques encourrus : ${post.risks!}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Préconisations sanitaires : ${post.sanitaires!}",
                    style: const TextStyle(fontSize: 16), 
                  ),
                ElevatedButton(
          onPressed: launchURL,
          child:Text(
                    "Lien vers la fiche rappel : ${post.rappel!}"
                  )
                )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
