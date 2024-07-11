import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/menu_pages/aprende_components/aprende_boxclass.dart';
import 'package:funciona_peru/theme/app_colors.dart';

// Define the ParallaxEffect widget as a StatefulWidget
class AprendePages extends StatefulWidget {
  const AprendePages({super.key, required this.category});
  final String category;

  @override
  State<AprendePages> createState() => _AprendePagesState();
}

// Define the state for ParallaxEffect
class _AprendePagesState extends State<AprendePages> {
  Stream? aprendeStream;
  // List of text strings to display on each page

  List<String> imagenes = [
    'https://i.pinimg.com/564x/1a/25/f8/1a25f8af618e8de9d56d691c38dd1244.jpg',
    'https://i.pinimg.com/564x/66/9c/56/669c567f113cdf3a94117716fa6c2429.jpg',
    'https://i.pinimg.com/564x/60/c1/17/60c1173130f8fc33f646bdc92813cbe8.jpg',
    'https://i.pinimg.com/564x/c2/e9/b4/c2e9b4c84c29b799c671178f17135545.jpg',
    'https://i.pinimg.com/564x/4d/2a/4c/4d2a4c4df1fbf9d659695c1289e8b2a9.jpg',
    'https://i.pinimg.com/564x/ec/ed/ae/ecedae225602e4280db2a3d0a941d0b0.jpg',
    'https://i.pinimg.com/564x/eb/21/9a/eb219a49fbf1d9e6c2964b9a6daaa405.jpg',
    'https://i.pinimg.com/564x/2b/d5/aa/2bd5aae68fd038022ed805d414ee49ca.jpg',
    'https://i.pinimg.com/564x/49/53/10/4953108cf44b7d3b8abb1054bca3af44.jpg',
    'https://i.pinimg.com/564x/09/48/a8/0948a8e004a484fc0c867d1bb95bea61.jpg'
  ];

  // ScrollController to track and manage the scroll position
  late ScrollController controller;

  getontheLoad() async {
    aprendeStream = await AprendeClass().getAprendedata(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    controller = ScrollController();
    getontheLoad();
    super.initState();

    // Add a listener to the ScrollController to trigger a rebuild on scroll
    controller.addListener(
      () {
        setState(() {});
      },
    );
  }

  Widget fullPages(Size size) {
    return StreamBuilder(
      stream: aprendeStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Stack(
                children: [
                  SizedBox(
                    child: ListView.builder(
                      // Assign the ScrollController to the ListView
                      //physics: SnappingScrollPhysics(itemExtent: size.height),
                      controller: controller,
                      itemCount: snapshot.data.docs.length, //imagenes.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.docs[index];
                        List data = ds['data'];
                        return Container(
                          height: size.height,
                          clipBehavior:
                              Clip.hardEdge, // Clip the overflowing content
                          decoration: const BoxDecoration(),
                          child: Stack(
                            children: [
                              // Background image with parallax effect
                              Container(
                                transform: Matrix4.identity()
                                  ..translate(
                                    0.0,
                                    controller.hasClients
                                        ? (-(index * size.height) +
                                                controller.position.pixels) /
                                            2 // Calculate the vertical translation for parallax effect
                                        : 1.0,
                                  ),
                                width: size.width,
                                height: size.height,
                                child: CachedNetworkImage(
                                  imageUrl: ds['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Colors.black87.withOpacity(0.75),
                                      Colors.black87.withOpacity(0.75),
                                    ],
                                  ),
                                ),
                              ),

                              // INICIO DE PAGINA
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 5, right: 5),
                                child: Column(
                                  children: [
                                    //titulo
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Center(
                                              child: Text(
                                                ds['titulo'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              )),
                                          const SizedBox(height: 10),
                                          //body descripcion
                                          Opacity(
                                            opacity: 0.9,
                                            child: SingleChildScrollView(
                                              child: Text(
                                                ds['descripcion'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                                textAlign: TextAlign.center,
                                                //overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    //items
                                    data.isNotEmpty
                                        ? SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: List.generate(
                                                data.length,
                                                (index) {
                                                  return Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 20),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 5,
                                                        horizontal: 5),
                                                    width: size.width * 0.7,
                                                    height: size.height * 0.55,
                                                    decoration: BoxDecoration(
                                                      color: mainColor600
                                                          .withOpacity(0.85),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              child:
                                                                  Image.network(
                                                                data[index]
                                                                    ['imgUrl'],
                                                                fit: BoxFit
                                                                    .cover,
                                                              )),
                                                        ),
                                                        Text(
                                                            data[index]
                                                                ['titulo'],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        15)),
                                                        Flexible(
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                Opacity(
                                                                  opacity: 0.9,
                                                                  child: Text(
                                                                    softWrap:
                                                                        true,
                                                                    data[index][
                                                                        'descripcion'],
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyLarge,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                              // FIN DE PAGINO
                              const Positioned(
                                bottom: 40,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.keyboard_double_arrow_down_rounded,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  //back button
                  Positioned(
                    left: 20,
                    top: 40,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: greyColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: fullPages(size),
    );
  }
}

// Nuevo scroll physics para  que bsuque al mas cercano
/*class SnappingScrollPhysics extends FixedExtentScrollPhysics {
  final double itemExtent;

  SnappingScrollPhysics({required this.itemExtent, ScrollPhysics? parent})
      : super(parent: parent);

  @override
  SnappingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SnappingScrollPhysics(
      itemExtent: itemExtent,
      parent: buildParent(ancestor),
    );
  }

  //@override
  double getItemExtent() => itemExtent;

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    final Tolerance tolerance = this.tolerance;

    if (velocity.abs() < tolerance.velocity &&
        (position.pixels - position.minScrollExtent).abs() <
            tolerance.distance) {
      return null;
    }

    double targetPixels = position.pixels;
    if (velocity < 0.0) {
      targetPixels = (position.pixels / itemExtent).floor() * itemExtent;
    } else if (velocity > 0.0) {
      targetPixels = (position.pixels / itemExtent).ceil() * itemExtent;
    } else {
      targetPixels = (position.pixels / itemExtent).round() * itemExtent;
    }

    targetPixels = targetPixels.clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );

    return ScrollSpringSimulation(
      spring,
      position.pixels,
      targetPixels,
      velocity,
      tolerance: tolerance,
    );
  }
}*/
