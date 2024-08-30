import 'package:flutter/material.dart';
import 'package:flutter_film_uygulamasi/DetaySayfa.dart';
import 'package:flutter_film_uygulamasi/Filmler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Uygulaması',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Filmler>> filmleriGetir() async {
    var filmlerListesi = <Filmler>[];
    var f1 = Filmler(
        film_id: 1,
        film_adi: "Anadoluda",
        film_resim_adi: "anadoluda.png",
        film_fiyat: 15.99);
    var f2 = Filmler(
        film_id: 2,
        film_adi: "Django",
        film_resim_adi: "django.png",
        film_fiyat: 9.99);
    var f3 = Filmler(
        film_id: 3,
        film_adi: "İnception",
        film_resim_adi: "inception.png",
        film_fiyat: 17.99);
    var f4 = Filmler(
        film_id: 4,
        film_adi: "İnterstallar",
        film_resim_adi: "interstellar.png",
        film_fiyat: 22.99);
    var f5 = Filmler(
        film_id: 5,
        film_adi: "The Hateful Eight",
        film_resim_adi: "thehatefuleight.png",
        film_fiyat: 35.99);
    var f6 = Filmler(
        film_id: 6,
        film_adi: "The Pianist",
        film_resim_adi: "thepianist.png",
        film_fiyat: 12.99);

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);

    return filmlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Filmler",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              itemCount: filmlerListesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3.5,
              ),
              itemBuilder: (context, indeks) {
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detaysayfa(film: film)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("resimler/${film.film_resim_adi}"),
                        ),
                        Text(
                          film.film_adi,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          "${film.film_fiyat} \u{20BA}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
