// Page simple avec barre d'application et une liste statique

import 'package:flutter/material.dart';

class ListHotels extends StatelessWidget {
  const ListHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Liste des hoteles"),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                    child: const Icon(Icons.hotel)),
                title: const Text("Hotel name 1"),
                subtitle: const Text("Hotel rating : 2.5"),
              ),
              ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                    child: const Icon(Icons.image)),
                title: const Text("Hotel name 2"),
                subtitle: const Text("Hotel rating : 5"),
              ),
              ListTile(
                leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                    child: const Icon(Icons.holiday_village)),
                title: const Text("Hotel name 3"),
                subtitle: const Text("Hotel rating : 3.8"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
