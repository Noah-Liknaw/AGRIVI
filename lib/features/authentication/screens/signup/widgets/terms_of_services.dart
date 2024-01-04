import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class TermsOfServices extends StatelessWidget {
  const TermsOfServices({
    super.key,
    required this.mdFileName,
  });
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: FutureBuilder(
                  future: Future.delayed(
                    const Duration(milliseconds: 150),
                  ).then(
                    (value) => rootBundle
                        .loadString('assets/terms_of_services/$mdFileName'),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(data: snapshot.data!);
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
          ),
          SizedBox(
            height: 50,
            width: double.maxFinite,
            child: ElevatedButton(
                style: const ButtonStyle(
                  side: MaterialStatePropertyAll(BorderSide.none),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(212, 50, 121, 20),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Back',
                  style: TextStyle(fontWeight: FontWeight.w400),
                )),
          )
        ],
      ),
    );
  }
}
