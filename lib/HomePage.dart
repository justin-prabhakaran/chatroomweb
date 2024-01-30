import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("asdad"),
      ),
      drawer: const Drawer(
        elevation: 0,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ListTile(
                title: Text(
                  "Hdasdasdad",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text("asdasdas"),
            )
          ],
        ),
      ),
      body: Column(children: [
        Expanded(child: Container()),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.search,
                size: 30,
              ),
              const Icon(
                Icons.search,
                size: 30,
              ),
              const Icon(
                Icons.search,
                size: 30,
              ),
              Expanded(
                child: TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        )
      ]),
    );
  }
}
