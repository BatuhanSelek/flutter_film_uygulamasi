// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_film_uygulamasi/Filmler.dart';

class Detaysayfa extends StatefulWidget {
  Filmler film;
  Detaysayfa({
    super.key,
    required this.film,
  });

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.film.film_adi,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_resim_adi}"),
            Text(
              "${widget.film.film_fiyat} \u{20BA}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("KİRALA"),
                onPressed: () {
                  print("${widget.film.film_adi} kiralandı.");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
