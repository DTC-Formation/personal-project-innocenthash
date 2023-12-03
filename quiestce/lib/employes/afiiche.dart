import 'package:flutter/material.dart';
import 'package:quiestce/employes/affiche_specifique.dart';
import 'package:quiestce/models/employe.dart';
import 'package:quiestce/options/couleurs.dart';
import 'package:quiestce/sqlite_database/sqlite_database.dart';

class Affiche extends StatefulWidget {
  const Affiche({super.key});

  @override
  State<Affiche> createState() => _AfficheState();
}

class _AfficheState extends State<Affiche> {
  List<Employe> tousEmployes = [];
  final sqliteDatabase = SqliteDatabase();

  Color vertEmeraude = Couleurs.vertEmeraude;

  Future<void> afficheEmploye() async {
    final affiche = await sqliteDatabase.getEmploye();

    setState(() {
      tousEmployes = affiche;
    });
  }

  @override
  void initState() {
    afficheEmploye();
    // TODO: implement initState
    super.initState();
  }

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
                  color: Colors.deepOrange,
                  style: BorderStyle.solid,
                  width: 3)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
               'Affichez tous les employés',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: tousEmployes.length,
          itemBuilder: (context, index) {
            final employe = tousEmployes[index];
            return Container(
              height: 500,
              child: Card(
                elevation: 0,
                color: vertEmeraude,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(colors: [
                        //   Couleurs.greyBlanc ,
                        //   Colors.black ,
                        //   Colors.deepPurple
                        // ]),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     blurRadius: 0,
                        //     blurStyle: BlurStyle.normal,
                        //     color: Colors.black54,
                        //     spreadRadius: 5 ,
                        //     // offset: Offset(2, 2)
                        //   ),
                        // ],
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 5,
                            style: BorderStyle.solid,
                            color: Colors.white),

                        color: Colors.amber,
                      ),
                      width: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.memory(
                          employe.image!,
                          cacheHeight: 100,
                          cacheWidth: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        
                          style: ButtonStyle(
                              side: MaterialStatePropertyAll(
                                  BorderSide(color: vertEmeraude))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AfficheSpecifique(
                                  employe: employe,
                                  afficheEmploye:afficheEmploye
            //                       function: (valeur) {
            //   setState(() {
            //     currentPage = valeur;
            //   });
            // },
                                ),
                              ),
                            );
                          },
                          child: Text('Voir plus' ,style: TextStyle(color: vertEmeraude), )),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
