import 'package:flutter/material.dart';
import 'package:funciona_peru/auth/auth_controller/login_page.dart';
import 'package:funciona_peru/theme/app_colors.dart';

class OnBordingScreen extends StatefulWidget {
  final Function()? onTap;
  const OnBordingScreen({super.key, required this.onTap});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  imagen: demo_data[index].image,
                  titulo: demo_data[index].titulo,
                  descripcion: demo_data[index].descripcion,
                ),
              ),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      //Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage(onTap: () {  },),
                      ));
                    },
                    child: const Text("Omitir")),
                const Spacer(),
                ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: DotIndicador(isActive: index == _pageIndex),
                        )),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {
                        if (demo_data.length - 1 == _pageIndex) {
                          //Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage(onTap: () {  },),
                          ));
                        }
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        weight: 600,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DotIndicador extends StatelessWidget {
  const DotIndicador({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 16 : 10,
      width: 10,
      decoration: BoxDecoration(
          color: isActive ? primaryColor : primaryColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Onboard {
  final String image, titulo, descripcion;

  Onboard(
      {required this.image, required this.titulo, required this.descripcion});
}

// ignore: non_constant_identifier_names
final List<Onboard> demo_data = [
  Onboard(
      image: "assets/onbording_imgs/tutorial.png",
      titulo: "Crea tu cuenta",
      descripcion: "Ingresa con tu cuenta y conoce nuestros servicios"),
  Onboard(
      image: "assets/onbording_imgs/exito.png",
      titulo: "Conoce como abrir tu negocio",
      descripcion:
          "Aprenderemos los requisitos para la obtencion de nuestra licencia."),
  Onboard(
      image: "assets/onbording_imgs/confiar.png",
      titulo: "Nosotros hacemos el seguimiento",
      descripcion:
          "Te mostraremos los pasos a seguir para la correcta obtencion de tus documentos municipales"),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.imagen,
    required this.titulo,
    required this.descripcion,
  });

  final String imagen, titulo, descripcion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imagen,
          height: 250,
        ),
        const Spacer(),
        Text(
          titulo,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Text(
          descripcion,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
