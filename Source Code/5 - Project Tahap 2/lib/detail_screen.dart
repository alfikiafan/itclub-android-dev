import 'package:flutter/material.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('images/Keraton_Kasunanan.jpeg'),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                'Keraton Kasunanan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(Icons.calendar_today),
                      const SizedBox(height: 8.0),
                      Text(
                        'Open Saturday-Thursday',
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.access_time),
                      const SizedBox(height: 8.0),
                      Text(
                        '09:00 - 14:00',
                        style: informationTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.monetization_on),
                      const SizedBox(height: 8.0),
                      Text(
                        'Rp 10.000',
                        style: informationTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Karaton Suråkartå Hadiningrat adalah Istana resmi Kesunanan Surakarta Hadiningrat yang terletak di Kota Surakarta. Keraton ini didirikan oleh Sri Susuhunan Pakubuwana II pada tahun 1744 sebagai pengganti Keraton Kartasura yang porak-poranda akibat Geger Pecinan pada tahun 1743.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/02/27/1d/58/der-innenhof.jpg?w=2400&h=-1&s=1'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/5a/d7/fe/kraton-surakarta-hadiningrat.jpg?w=1400&h=-1&s=1'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/27/e3/91/sam-6480-largejpg.jpg?w=800&h=-1&s=1'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
