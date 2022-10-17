import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int step = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "User singup App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Stepper(
            currentStep: step,
            onStepTapped: (value) {
              setState(() {
                step = value;
              });
            },
            onStepContinue: () {
              setState(() {
                if (step < 2) step++;
              });
            },
            onStepCancel: () {
              setState(() {
                if (step > 0) step--;
              });
            },
            steps: [
              Step(
                isActive: (step >= 0) ? true : false,
                title: const Text("Sing up"),
                content: Column(
                  children: const [
                    TextField(
                      decoration: InputDecoration(hintText: "Full Name"),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Email id"),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                  ],
                ),
              ),
              Step(
                isActive: (step >= 1) ? true : false,
                title: const Text("Login"),
                content: Column(
                  children: const [
                    TextField(
                      decoration: InputDecoration(

                          hintText: "User Name"
                      ),
                    ),TextField(
                      decoration: InputDecoration(

                          hintText: "Password"
                      ),
                    ),

                  ],
                ),
              ),
              Step(
                isActive: (step >= 2) ? true : false,
                title: const Text("Home"),
                content: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
