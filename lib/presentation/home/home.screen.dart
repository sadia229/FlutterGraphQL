import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.characters.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.characters.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(controller.characters[index]['image'],fit: BoxFit.cover),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.characters[index]['name']),
                        Text(controller.characters[index]['status']),
                        Text(controller.characters[index]['species']),
                        Text(controller.characters[index]['gender']),
                        Text(controller.characters[index]['origin']['name']),
                        Text(controller.characters[index]['location']['name']),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
