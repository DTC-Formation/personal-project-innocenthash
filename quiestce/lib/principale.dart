import 'package:flutter/material.dart';
import 'package:quiestce/employes/afiiche.dart';
import 'package:quiestce/employes/save.dart';
import 'package:quiestce/options/couleurs.dart';
import 'package:quiestce/poste/save_poste.dart';
import 'package:quiestce/reconnaissance_employe/reconnaissance_faciale_employe.dart';

class Principale extends StatefulWidget {
  const Principale({super.key});

  @override
  State<Principale> createState() => _PrincipaleState();
}

class _PrincipaleState extends State<Principale> {
  Color vertEmeraude = Couleurs.vertEmeraude;
  bool isCurrent = false;
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
              'Qui-Est-Ce',
              style: TextStyle(color: Colors.white, fontSize: 15,
                fontWeight: FontWeight.bold),
              
            ),
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 169, 136, 1.0),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromARGB(255, 0, 0, 0),
                          border: Border.all(color: Colors.white, width: 5)),
                      height: 120,
                      width: 120,
                      child: Image.asset('assets/logo/mylogo.png',
                          fit: BoxFit.contain),
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Nouvel employé'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Save(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Nos employées'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Affiche(),
                  ),
                );
              },
            ),
            const Divider(
              endIndent: 20,
              indent: 20,
              thickness: 1,
              color: Colors.white,
            ),
            ListTile(
              tileColor: vertEmeraude,
              leading: const Icon(Icons.business_center),
              
              iconColor: Colors.white,
              title: const Text(
                'Poste',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavePoste(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: const Text('Liste poste'),
              onTap: () {},
            ),
            ListTile(
              // selectedColor: Colors.amber,
              // selectedTileColor: Colors.amber,
              // splashColor: Colors.amberAccent,

              leading: const Icon(Icons.person_pin),
              title: const Text("Entretien d'embauche"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.folder_shared),
              title: const Text('Controleur Resultats'),
              onTap: () {},
            ),
            const Divider(
              endIndent: 20,
              indent: 20,
              thickness: 1,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                  'assets/images/vue-3d-homme-affaires__1_-removebg-preview.png'),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  Text(
                    'Automatisez Votre Gestion RH \n',
                    style: TextStyle(
                      color: Color.fromARGB(255, 100, 100, 100),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Optimisez l'efficacité de votre gestion des ressources humaines avec notre application innovante, éliminant toute préoccupation liée à la reconnaissance des informations de vos employés. Simplifiez le processus et concentrez-vous sur l'essentiel de votre activité ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
              // child: Center(
              //   child: RichText(
              //       text: const TextSpan(
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontStyle: FontStyle.normal,
              //             wordSpacing: 2,
              //           ),
              //           children: [
              //         TextSpan(
              //           text: 'Automatisez Votre Gestion RH \n',
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //             textBaseline: TextBaseline.alphabetic ,

              //           ),
              //         ),
              //         TextSpan(
              //             text:
              //                 "Optimisez l'efficacité de votre gestion des ressources humaines avec notre application innovante, éliminant toute préoccupation liée à la reconnaissance des informations de vos employés. Simplifiez le processus et concentrez-vous sur l'essentiel de votre activité ",
              //             style: TextStyle()),
              //       ])),
              // ),
            ),
            Container(
              // margin: EdgeInsets.only(top: 90),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                // gradient: RadialGradient(colors:[
                //   // Colors.red ,
                //    vertEmeraude,

                // ] ) ,
                boxShadow: [
                  BoxShadow(
                      color: vertEmeraude,
                      // offset: Offset(20, 20) ,
                      blurRadius: 20,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.normal),
                ],
                border: Border.all(
                  color: vertEmeraude,
                  width: 5,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(100),
                color: vertEmeraude,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const ReconnaissanceFacialeEmploye();
                    }),
                  );
                },
                icon: const Icon(
                  Icons.person_2_rounded,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            )
          ],
        ),
      ),

      // backgroundColor: Color.fromRGBO(0, 0, 128, 1.0),
    );
  }
}
