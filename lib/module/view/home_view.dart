import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeViewModel(),
      child: _body(context),
    );
  }

  // justin@modern.pet

  Widget _body(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Rick And Morty Generator',
                  style: TextStyle(fontSize: 24),
                ),
                _bodyData(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      maximumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      provider.randomIntData();
                    },
                    child: const Text('Generate'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _bodyData() {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                provider.modelView.img.isEmpty
                    ? Image.asset(
                        "assets/img.png",
                        height: 150,
                        width: 150,
                      )
                    : Image.network(
                        provider.modelView.img,
                        height: 150,
                        width: 150,
                      ),
                Text(
                  provider.modelView.name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _keyValueWidget("Gender", provider.modelView.gender),
                    _keyValueWidget("Location", provider.modelView.location),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _keyValueWidget(String key, String value) {
    return Column(
      children: [
        Text(
          key,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xffC5C5C5),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
