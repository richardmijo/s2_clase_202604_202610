import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Una pantalla de demostración que muestra las capacidades del widget Image en Flutter.
/// Basado en los conceptos de: Constructores, Propiedades y Patrones reales.
class ImageShowcaseScreen extends StatelessWidget {
  const ImageShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showcase: Flutter Image Widget'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader('1. Constructores Básicos'),
          const Text(
            'Existen 4 formas principales de cargar imágenes. Aquí vemos las dos más comunes:',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 16),

          // --- Image.asset ---
          _buildExampleCard(
            title: 'Image.asset()',
            subtitle: 'Carga desde la carpeta assets/ del proyecto.',
            child: Image.asset('assets/images/logo.png', height: 100),
          ),

          // --- Image.network ---
          _buildExampleCard(
            title: 'Image.network()',
            subtitle: 'Carga desde una URL de internet.',
            child: Image.network(
              'https://picsum.photos/seed/uide/400/200',
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          const Divider(height: 40),
          _buildSectionHeader('2. Propiedades de Ajuste (BoxFit)'),
          const Text(
            'Cómo la imagen se adapta al espacio disponible.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 16),

          // --- Ejemplo de BoxFit.cover y colorFilter ---
          _buildExampleCard(
            title: 'BoxFit.cover + Color Filter',
            subtitle: 'Ocupa todo el espacio y aplica un tinte.',
            child: Container(
              height: 150,
              width: double.infinity,
              child: Image.network(
                'https://picsum.photos/400/300',
                fit: BoxFit.cover,
                // Filtro de color: oscurece la imagen para que el texto sea legible (ejemplo avanzado)
                color: Colors.indigo.withOpacity(0.3),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),

          const Divider(height: 40),
          _buildSectionHeader('3. Patrones Reales de Uso'),
          const Text(
            'Ejemplos de cómo se ven las imágenes en aplicaciones reales.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 16),

          // --- PATRÓN 1: Bordes Redondeados ---
          _buildExampleCard(
            title: 'Patrón 1: Bordes Redondeados',
            subtitle: 'Uso de ClipRRect para suavizar esquinas.',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://picsum.photos/seed/rounded/400/200',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // --- PATRÓN 2: Avatar Circular ---
          _buildExampleCard(
            title: 'Patrón 2: Avatar Circular',
            subtitle: 'CircleAvatar (recomendado) vs ClipOval.',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?u=1',
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('CircleAvatar', style: TextStyle(fontSize: 10)),
                  ],
                ),
                Column(
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://i.pravatar.cc/150?u=2',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('ClipOval', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),

          // --- PATRÓN 3: Fondo con Texto ---
          _buildExampleCard(
            title: 'Patrón 3: Imagen como Fondo',
            subtitle: 'Uso de BoxDecoration con DecorationImage.',
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/seed/bg/400/200'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black45,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: const Center(
                child: Text(
                  'TEXTO SOBRE IMAGEN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),

          // --- PATRÓN 4: Stack con Gradiente ---
          _buildExampleCard(
            title: 'Patrón 4: Stack + Gradiente',
            subtitle: 'Combinación de widgets para un acabado premium.',
            child: Container(
              height: 200,
              clipBehavior: Clip
                  .antiAlias, // Esto es para que el contenido respete los bordes redondeados
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  // Capa inferior: La imagen
                  Positioned.fill(
                    child: Image.network(
                      'https://picsum.photos/seed/stack/400/300',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Capa media: Gradiente de sombra
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Capa superior: Texto posicionado
                  const Positioned(
                    bottom: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Título del Proyecto',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Subtítulo o descripción corta',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- PATRÓN 5: Estados de Carga y Error ---
          _buildExampleCard(
            title: 'Patrón 5: Carga y Error',
            subtitle: 'Manejo de estados en Image.network.',
            child: Image.network(
              'https://invalid-url-example.com/image.jpg', // URL inválida para forzar error
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              // Qué mostrar mientras carga
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              // Qué mostrar si falla
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  color: Colors.grey[200],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.broken_image, color: Colors.grey, size: 40),
                      SizedBox(height: 8),
                      Text(
                        'No se pudo cargar la imagen',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // Helper para títulos de sección
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }

  // Helper para tarjetas de ejemplo
  Widget _buildExampleCard({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
