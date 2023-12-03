import 'package:flutter/material.dart';
import 'package:quiestce/options/couleurs.dart';
import 'package:quiestce/options/image_scroll.dart';

class SavePoste extends StatefulWidget {
  const SavePoste({super.key});

  @override
  State<SavePoste> createState() => _SavePosteState();
}

class _SavePosteState extends State<SavePoste> {
  TextEditingController poste = TextEditingController();
  TextEditingController salaire = TextEditingController();
  Color vertEmeraude = Couleurs.vertEmeraude;
  List<Map<String, dynamic>> imageScroll = ImageScroll.imageScroll;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.deepOrange ,
              style: BorderStyle.solid ,
              width: 3
            )
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Poste',
              style: TextStyle(color: Colors.white, fontSize: 15,
                fontWeight: FontWeight.bold),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      // color: const Color.fromARGB(255, 37, 37, 37),
                      // border: Border.all(color: Colors.black87),
                      ),
                  child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          List.generate(imageScroll.length, (index) {
                            final image = imageScroll[index];
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: const BoxDecoration(
                                        // border: Border.all(width: 1),
                                        // color: Colors.black12,
                                        ),
                                    child: ShaderMask(
                                      shaderCallback: (mask) {
                                        return const LinearGradient(
                                                colors: [
                                              Color.fromARGB(221, 35, 35, 35),
                                              Color.fromARGB(95, 217, 217, 217),
                                              Colors.grey
                                            ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter)
                                            .createShader(mask);
                                      },
                                      child: Image.asset(
                                        image['image'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: 200,
                                      height: 20,
                                      margin: const EdgeInsets.only(top: 30),
                                      color: Colors.white,
                                      // padding: EdgeInsets.all(5),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          image['poste'],
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 42, 42, 42)),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: poste,
                  decoration: InputDecoration(
                      hintText: 'Saisissez le poste',
                      labelText: 'Poste',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38))),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: poste,
                  decoration: const InputDecoration(
                      hintText: 'Saisissez la salaire',
                      labelText: 'Salaire',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38))),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: vertEmeraude,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.transparent))),
                  onPressed: () {},
                  child: const Text('Enregistrez !',
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
