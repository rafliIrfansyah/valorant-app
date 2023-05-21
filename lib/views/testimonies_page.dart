import 'package:flutter/material.dart';
import 'package:valorant_app/common/styles.dart';

class TestimoniesPage extends StatefulWidget {
  const TestimoniesPage({super.key});
  static const routeName = '/testimonies';

  @override
  TestimoniesPageState createState() => TestimoniesPageState();
}

class TestimoniesPageState extends State<TestimoniesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Player Testimonies',
          style: TextStyle(
            color: secondaryColor,
            fontFamily: 'Tungsten-Bold',
            fontSize: 32,
          ),
        ),
      ),
      body: ListView(
        children: const [
          ExpansionTile(
            title: Text(
              'Saran',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Sebaiknya soal-soal terkait tugas, kuis, UTS, dan UAS dibuat lebih mudah lagi untuk ke depannya.',
                  style: TextStyle(
                    fontFamily: 'URW DIN W05 Medium',
                    fontSize: 16,
                    color: accentColor,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Kesan',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Pengalaman yang asik dalam belajar terkait pemrograman secara mobile. Walaupun untuk hal-hal terkait jaringan komunikasi daya tidak terlalu paham. Setidaknya dalam pembuatan aplikasi mobile nya saya masih bisa keep up hehe :)',
                  style: TextStyle(
                    fontFamily: 'URW DIN W05 Medium',
                    fontSize: 16,
                    color: accentColor,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              'Pesan',
              style: TextStyle(
                fontFamily: 'URW DIN W05 Bold',
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Semoga Pembelajaran TPM, terutama oleh Pak Bagus dapat diteruskan secara baik.',
                  style: TextStyle(
                    fontFamily: 'URW DIN W05 Medium',
                    fontSize: 16,
                    color: accentColor,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
