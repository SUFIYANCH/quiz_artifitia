import 'package:flutter/material.dart';
import 'package:quiz_artifitia/utils/app_color.dart';
import 'package:quiz_artifitia/utils/responsive.dart';
import 'package:quiz_artifitia/views/home_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            SizedBox(
                height: R.sh(316, context),
                child: Image.asset("assets/quizlogo.png", fit: BoxFit.cover)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(R.sw(150, context), R.sh(50, context)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(R.sw(12, context))),
                    backgroundColor: const Color(0xff8514E1)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: Text(
                  "Start Quiz",
                  style:
                      TextStyle(color: whiteColor, fontSize: R.sw(18, context)),
                )),
            const Spacer(
              flex: 1,
            ),
            const Text(
              "Powered by",
              style: TextStyle(color: Colors.white54),
            ),
            Text(
              "www.artifitia.com",
              style:
                  TextStyle(color: Colors.white54, fontSize: R.sw(16, context)),
            ),
            SizedBox(
              height: R.sh(50, context),
            )
          ],
        ),
      ),
    );
  }
}
