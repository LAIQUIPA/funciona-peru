import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/home_components/box_stack.dart';
import 'package:funciona_peru/home/pages/home_components/publicidad_inicial.dart';
import 'package:funciona_peru/home/pages/home_components/game_menu_button.dart';
import 'package:funciona_peru/home/pages/menu_pages/aprende_game.dart';
import 'package:funciona_peru/home/pages/menu_pages/preparate_game.dart';
import 'package:funciona_peru/home/pages/menu_pages/comienza_game.dart';
import 'package:funciona_peru/theme/app_colors.dart';
import 'package:funciona_peru/theme/imagenes.dart';
import 'package:funciona_peru/theme/textos.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagenesLic = [
      'https://i.pinimg.com/564x/97/5f/2c/975f2c79092a01301ef07e40cd5d69e6.jpg',
      'https://i.pinimg.com/564x/93/6a/58/936a58fd80223467b664fc5643e7f9ce.jpg',
      'https://i.pinimg.com/564x/fb/e8/76/fbe87641d0275fd043fe98f945faed97.jpg',
      'https://i.pinimg.com/564x/1e/3d/b9/1e3db9680bbcb0d8b7a1fb4443d4465c.jpg'
    ];

    List<String> imagenesITSE = [
      'https://i.pinimg.com/564x/22/a0/87/22a087857cf262b835abe5e086a3ce87.jpg',
      'https://i.pinimg.com/564x/a5/78/ef/a578efa9b8d8b336e419ddaa2ff2706a.jpg',
      'https://i.pinimg.com/564x/4f/e3/22/4fe322e766959d9c4b17d80755ea4a21.jpg',
      'https://i.pinimg.com/736x/49/3b/60/493b603f188515d9b699de4102863b4f.jpg'
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leadingWidth: 50,
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
        //backgroundColor: const Color(0xFFb42224),
        elevation: 2,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15, top: 15, bottom: 15),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(60),
                splashColor: mainColor600.withOpacity(0.4),
                child: Ink(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.notifications,
                    color: greyColor,
                    size: 25,
                  ),
                ),
              ))
        ],
        title: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Image.asset(wLogo, height: 100),
        ),
      ),
      /*leading: const Padding(
          padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
          child: CircleAvatar(
            maxRadius: 15,
            minRadius: 15,
            child: Icon(Icons.person),
          ),
        ),*/

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //PUBLCIIDAD
                const SizedBox(height: 15),
                const PublicidadInicial(),
                const SizedBox(height: 20),
                //LICENCIAS
                Text(licenciasMenu,
                    style: Theme.of(context).textTheme.titleSmall),
                //LISTA DE LICENCIAS
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const BoxStack(
                          imgUrl:
                              'https://i.pinimg.com/564x/7d/8c/70/7d8c703abc6e0c4486cefd1f87a988ad.jpg',
                          title: 'Descubre',
                        ),
                        //BUTTONS
                        GameMenuButton(
                          title: 'Aprende',
                          info: descripcionAprende,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AprendeGame(
                                category: 'Licencia',
                                imagenes: imagenesLic,
                                descripcion:
                                    'Este curso te guiará a través del proceso de obtención de licencias municipales, proporcionando conocimientos esenciales sobre requisitos, trámites y normativas. Ideal para emprendedores y profesionales.',
                              ),
                            ));
                          },
                        ),
                        GameMenuButton(
                            title: 'Comienza tu trámite',
                            info: descripcionComienza,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ComienzaGame(
                                  category: 'Licencia',
                                ),
                              ));
                            }),

                        GameMenuButton(
                          title: 'Preparate',
                          info: descripcionJuega,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PreparateGame(
                                category: 'Licencia',
                              ),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                //ITSE
                Text(itseMenu,
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis),
                //LISTA DE ITSE
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const BoxStack(
                          imgUrl:
                              'https://i.pinimg.com/564x/d9/50/86/d950869a8d962239f33036f4a180ee08.jpg',
                          title: 'Comienza',
                        ),
                        //MENU BUTTONS
                        GameMenuButton(
                            title: 'Aprende',
                            info: descripcionAprendeITSE,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AprendeGame(
                                  category: 'ITSE',
                                  imagenes: imagenesITSE,
                                  descripcion:
                                      'Conoce las medidas de seguridad en un negocio, los participantes sabran cómo identificar que medidas de seguridad adoptar ante emergencias de origen natural o antropico(originado por acción humana)',
                                ),
                              ));
                            }),
                        /*GameMenuButton(
                          title: 'Comienza tu trámite',
                          info: descripcionComienzaITSE,
                          onTap: () {},
                        ),*/

                        GameMenuButton(
                            title: 'Preparate',
                            info: descripcionJuegaITSE,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const PreparateGame(
                                  category: 'ITSE',
                                ),
                              ));
                            }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                //MARCO NORMATIVO
                Text('Marco Normativo - Leyes',
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis),
                //LISTA DE ITSE
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const BoxStack(
                          imgUrl:
                              'https://i.pinimg.com/564x/55/2d/ab/552dabec5aa53ec370ab060c6a63f9c4.jpg',
                          title: 'Conoce',
                        ),
                        //MENU BUTTONS
                        GameMenuButton(
                            title: 'Ley Nº 28976',
                            info: descripcionLic,
                            onTap: () {}),
                        GameMenuButton(
                          title: 'DS N.° 002-2018-PCM',
                          info: descripcionItse,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),

                //TEXTO
                /*Text(email),
                Lottie.asset(
                  'assets/lottie/consult_girl.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
