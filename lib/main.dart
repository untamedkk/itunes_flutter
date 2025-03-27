import 'package:flutter/material.dart';
import 'package:flutter_itunes_search/ui/search/screen_search.dart';
import 'package:get/get.dart';

import 'router/app_route.dart';
import 'ui/search/binding/screen_search_binding.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoute.initial,
      initialBinding: ScreenSearchBinding(),
      getPages: AppRoute.routes,
      home: const ScreenSearch(),
    );
  }
}

// Dear Hiring Manager,
//
// I am excited to apply for the Android Developer position at Capgemini Hong Kong Limited. With over 12 years of experience maintaining and developing software applications, and leading digital transformation initiatives, I am confident in my ability to support Link International's mission of delivering innovative solutions.
//
// - I led a team to implement OMS, KYC module, Mobile App/Frontend APIs, helped Lora Technologies to obtain a trading license from SFC.
//
// - Migrating legacy systems to cloud-based platforms, enhancing scalability and security.
//
// - Collaborating with stakeholders to deliver tailored IT solutions that improved user satisfaction.
//
// I am particularly drawn to Link International's commitment to leveraging technology for better solutions. My expertise in software development, Digital Transformation, SDLC, Team Management and strong leadership skills position me to make an immediate impact.
//
// Additionally, I would like to highlight that I am Hong Kong permanent resident, I can join immediately, and my current salary is HKD 56,400 per month.
//
// I would welcome the opportunity to discuss how I can contribute to Link International. Thank you for considering my application. I look forward to the possibility of speaking with you.
//
// Sincerely,
// Krishna Gupta
// 9444 4734
