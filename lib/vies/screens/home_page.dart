import 'package:flutter/material.dart';
import 'package:interview/controllers/api_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future? futureData;
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: const Alignment(0, 0.5),
        children: [
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                          height: 25,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(20))),
                        ),
                        const SizedBox(height: 2),
                        Align(
                          alignment: const Alignment(-0.035, 0),
                          child: Container(
                            height: 50,
                            width: 25,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "PharmaFast",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Medicine Solution",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                  ))
            ],
          ),
          Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              color: Colors.grey,
              height: 400,
              width: double.infinity,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Mobile number"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      passwordController.text = val!;
                    },
                    controller: passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("Login")),
                  FutureBuilder(
                      future: ApiHelper.apiHelper.fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("${snapshot.error}"),
                          );
                        } else if (snapshot.hasData) {
                          Map? data = snapshot.data;
                          return Column(
                            children: [Text("${data!['ResponseMsg']}")],
                          );
                        }
                        return const Center(
                          child: Text("No data"),
                        );
                      })
                ],
              )),
        ],
      ),
    );
  }
}
