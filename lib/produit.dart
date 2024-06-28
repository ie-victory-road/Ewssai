import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dot.dart';
import 'main.dart';

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
