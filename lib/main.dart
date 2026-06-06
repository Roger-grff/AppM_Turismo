import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const SingleChildScrollView(
          
          child: Column(
            children: [
              ImageSection(image: 'images/mitad_mundo.jpg'),
              TitleSection(name: 'Mitad del Mundo', location: 'UIO'),
              ButtonSection(
                mapsUrl: 'https://maps.google.com/?q=Mitad+del+Mundo+Ecuador',
              ),
              TextSection(description: 'Monumento ubicado cerca de Quito que marca la línea ecuatorial. Los visitantes pueden aprender sobre geografía, cultura ecuatoriana y realizar experimentos relacionados con la gravedad y el equilibrio.'),

              ImageSection(image: 'images/cotopaxi.jpg'),
              TitleSection(name: 'Parque Nacional Cotopaxi', location: 'GYE'),
              ButtonSection(
                mapsUrl: 'https://maps.google.com/?q=Parque+Nacional+Cotopaxi',
              ),
              TextSection(description: 'Hogar del volcán Cotopaxi, uno de los volcanes activos más altos del mundo. Es ideal para realizar senderismo, ciclismo de montaña y observar paisajes andinos.'),
              
              ImageSection(image: 'images/galapagos.jpg'),
              TitleSection(name: 'Islas Galápagos', location: 'CUE'),
              ButtonSection(
                mapsUrl: 'https://maps.google.com/?q=Islas+Galapagos+Ecuador',
              ),
              TextSection(description: 'Famosas por su biodiversidad única y por inspirar la teoría de la evolución de Charles Darwin. Ofrecen actividades como buceo, snorkel y observación de fauna..'),

              ImageSection(image: 'images/cuenca.jpg'),
              TitleSection(name: 'Cuenca', location: 'GLP'),
              ButtonSection(mapsUrl: 'https://maps.google.com/?q=Cuenca+Ecuador',),
              TextSection(description: 'Ciudad declarada Patrimonio Cultural de la Humanidad por la UNESCO. Destaca por su arquitectura colonial, iglesias históricas y ambiente cultural.'),
            
              ImageSection(image: 'images/baños.jpg'),
              TitleSection(name: 'Baños de Agua Santa', location: 'GLP'),
              ButtonSection(mapsUrl: 'https://maps.google.com/?q=Baños+de+Agua+Santa+Ecuador',),
              TextSection(description: 'Conocida como la capital de la aventura del Ecuador. Ofrece cascadas, puentes, deportes extremos, aguas termales y el famoso columpio del fin del mundo.'),

              ImageSection(image: 'images/laguna.jpg'),
              TitleSection(name: 'Laguna de Quilotoa', location: 'GLP'),
              ButtonSection(mapsUrl: 'https://maps.google.com/?q=Laguna+de+Quilotoa',),
              TextSection(description: 'Laguna de origen volcánico con aguas de color turquesa ubicada dentro de un cráter. Es uno de los paisajes naturales más impresionantes del país.'),

              ImageSection(image: 'images/yasuni.jpg'),
              TitleSection(name: 'Parque Nacional Yasuní', location: 'GLP'),
              ButtonSection(mapsUrl: 'https://maps.google.com/?q=Parque+Nacional+Yasuni',),
              TextSection(description: 'Una de las zonas con mayor biodiversidad del planeta. Permite explorar la selva amazónica y conocer comunidades indígenas.'),

              ImageSection(image: 'images/guayas.jpg'),
              TitleSection(name: 'Guayaquil', location: 'GLP'),
              ButtonSection(mapsUrl: 'https://maps.google.com/?q=Guayaquil+Ecuador',),
              TextSection(description: 'La ciudad más poblada del Ecuador. Entre sus principales atractivos están el Malecón 2000, Las Peñas y el Cerro Santa Ana.'),

              ImageSection(image: 'images/lake.jpg'),
              TitleSection(name: 'Nariz del Diablo', location: 'GLP'),
              ButtonSection(mapsUrl: 'https://maps.google.com/?q=Nariz+del+Diablo+Alausi',),
              TextSection(description: 'Famosa ruta ferroviaria construida en una empinada montaña. Es considerada una de las obras de ingeniería más impresionantes del país.'),

              ImageSection(image: 'images/q.jpg'),
              TitleSection(name: 'Reserva de Producción Faunística Cuyabeno', location: 'GLP'),
              ButtonSection(mapsUrl: 'https://maps.google.com/?q=Reserva+Cuyabeno',),
              TextSection(description: 'Área protegida amazónica conocida por sus lagunas, ríos y gran diversidad de especies animales y vegetales. Es un destino ideal para el ecoturismo.'),       
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /* /1/ */
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* /2/ */
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /* /3/ */
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    super.key,
    required this.mapsUrl,
  });

  final String mapsUrl;

  Future<void> _openMaps() async {
    final Uri url = Uri.parse(mapsUrl);

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('No se pudo abrir Google Maps');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWithText(
          color: color,
          icon: Icons.near_me,
          label: 'MAPA',
          onPressed: _openMaps,
        ),
        ButtonWithText(
          color: color,
          icon: Icons.call,
          label: 'CALL',
          onPressed: () {},
        ),
        ButtonWithText(
          color: color,
          icon: Icons.share,
          label: 'SHARE',
          onPressed: () {},
        ),
      ],
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount--;
        _isFavorited = false;
      } else {
        _favoriteCount++;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          icon: Icon(
            _isFavorited ? Icons.star : Icons.star_border,
          ),
          color: Colors.red,
          onPressed: _toggleFavorite,
        ),
        Text('$_favoriteCount'),
      ],
    );
  }
}


