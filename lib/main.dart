import 'package:flutter/material.dart';

void main() => runApp(const AppMiTabBar());

class AppMiTabBar extends StatelessWidget {
  const AppMiTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ejemplo TabBar José Beltrán",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MiPaginaInicial(),
    );
  }
} //Fin AppMiTabBar

//Stateful
class MiPaginaInicial extends StatefulWidget {
  const MiPaginaInicial({Key? key}) : super(key: key);

  @override
  State<MiPaginaInicial> createState() => _MiPaginaInicialState();
} //MiPaginaInicial

class _MiPaginaInicialState extends State<MiPaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff132b3b),
          title: const Text("Tabbar Piscinas Poolman",
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xff5f5f5f),
            tabs: [
              Tab(
                text: "Compra",
                icon: Icon(Icons.shopping_basket),
              ),
              Tab(
                text: "Configura",
                icon: Icon(Icons.settings),
              ),
              Tab(
                text: "Empleados",
                icon: Icon(Icons.people),
              ),
              Tab(
                text: "Contacto",
                icon: Icon(Icons.contact_mail),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: const <Widget>[
            imagenStyle(
              imageUrl:
                  "https://raw.githubusercontent.com/BeltranJ128/img_iOS/main/FlutterFlowA12/productooo.jpg",
            ),
            imagenStyle(
              imageUrl: "assets/config.jpg",
            ),
            imagenStyle(
              imageUrl: "assets/empleadopiscina.jpg",
            ),
            imagenStyle(
              imageUrl:
                  "https://raw.githubusercontent.com/BeltranJ128/img_iOS/main/FlutterFlowA12/contacto.jpg",
            ),
          ],
        ),
      ),
    );
  }
}

class imagenStyle extends StatelessWidget {
  final String imageUrl;
  const imagenStyle({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 400,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: imageUrl.startsWith('http')
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
