import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login page"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //image

          Image.asset(
            "images/login.jpg",
            height: 160,
          ),
          const SizedBox(
            height: 10,
          ),
          //title
          const Text("SIGN IN",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          // email textfield
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(239, 212, 85, 0),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    iconColor: Colors.amberAccent),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          // password textfield
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(239, 212, 85, 0),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    iconColor: Colors.amberAccent),
              ),
            ),
          ),

          const SizedBox(
            height: 15,
          ),
          //button sign in
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 139, 7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "SignIn",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
