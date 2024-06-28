import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dot.dart';
import 'page.dart';

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://data.economie.gouv.fr/api/explore/v2.1/catalog/datasets/rappelconso0/records?select=nature_juridique_du_rappel%2Ccategorie_de_produit%2Csous_categorie_de_produit%2Cnom_de_la_marque_du_produit%2Cnoms_des_modeles_ou_references%2Cidentification_des_produits%2Cinformations_complementaires%2Cmotif_du_rappel%2Crisques_encourus_par_le_consommateur%2Cpreconisations_sanitaires%2Cconduites_a_tenir_par_le_consommateur%2Cnumero_de_contact%2Cmodalites_de_compensation%2Cliens_vers_les_images%2Clien_vers_affichette_pdf%2Clien_vers_la_fiche_rappel%2Cdate_de_publication&order_by=date_de_publication%20desc&limit=20'));
}
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
