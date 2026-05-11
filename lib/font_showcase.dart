import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Una pantalla de demostración que muestra cómo manejar fuentes en Flutter.
/// Basado en los métodos: Fuentes manuales (assets) y el paquete google_fonts.
class FontShowcaseScreen extends StatelessWidget {
  const FontShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showcase: Fuentes y Tipografía'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader('Método 1: Fuentes Manuales'),
          const Text(
            'Este método requiere descargar archivos .ttf, ponerlos en assets/fonts/ y declararlos en pubspec.yaml.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          
          // --- Ejemplo de configuración ---
          _buildExampleCard(
            title: 'Configuración en pubspec.yaml',
            subtitle: 'Así declaramos la fuente física en el proyecto:',
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              color: Colors.grey[100],
              child: const Text(
                'fonts:\n  - family: PoppinsAssets\n    fonts:\n      - asset: assets/fonts/Poppins-Regular.ttf\n      - asset: assets/fonts/Poppins-Bold.ttf\n        weight: 700',
                style: TextStyle(fontFamily: 'Courier', fontSize: 12),
              ),
            ),
          ),

          // Simulación de fuente manual
          _buildExampleCard(
            title: 'Uso en código (TextStyle)',
            subtitle: 'Así se aplica la fuente declarada en pubspec.yaml:',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Este texto YA USA "Poppins" cargada desde assets.',
                  style: TextStyle(
                    fontFamily: 'PoppinsAssets', // Coincide con el nombre en pubspec.yaml
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.green[50],
                  child: const Row(
                    children: [
                      Icon(Icons.check_circle_outline, size: 16, color: Colors.green),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '¡Configurado! Los archivos .ttf ya están en assets/fonts/ y registrados.',
                          style: TextStyle(fontSize: 11, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 40),
          _buildSectionHeader('Método 2: Google Fonts (Recomendado)'),
          const Text(
            'Es el método más ágil para desarrollo. Permite usar miles de fuentes sin descargar archivos manualmente.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 16),

          // --- Poppins ---
          _buildExampleCard(
            title: 'Fuente: Poppins',
            subtitle: 'Ideal para interfaces modernas y limpias.',
            child: Text(
              'La educación es el arma más poderosa para cambiar el mundo.',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
            ),
          ),

          // --- Montserrat ---
          _buildExampleCard(
            title: 'Fuente: Montserrat',
            subtitle: 'Excelente para encabezados y títulos fuertes.',
            child: Text(
              'DISEÑO DE INTERFACES MÓVILES',
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
          ),

          // --- Roboto Slab ---
          _buildExampleCard(
            title: 'Fuente: Roboto Slab (Serif)',
            subtitle: 'Fuentes con remates (serif) para textos de lectura larga.',
            child: Text(
              'Este es un ejemplo de una fuente Serif, que suele dar un aspecto más serio o académico a la aplicación.',
              style: GoogleFonts.robotoSlab(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),

          // --- Playfair Display ---
          _buildExampleCard(
            title: 'Fuente: Playfair Display',
            subtitle: 'Elegante y clásica para marcas premium.',
            child: Text(
              'UIDE - Programación Móvil',
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Divider(height: 40),
          _buildSectionHeader('Pesos y Estilos'),
          const Text(
            'Una misma fuente puede tener múltiples variaciones de grosor.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 16),

          _buildExampleCard(
            title: 'Variaciones de Peso (Poppins)',
            subtitle: 'Desde Thin (100) hasta Black (900).',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Peso 100 - Thin', style: GoogleFonts.poppins(fontWeight: FontWeight.w100, fontSize: 16)),
                Text('Peso 400 - Regular', style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16)),
                Text('Peso 700 - Bold', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 16)),
                Text('Peso 900 - Black', style: GoogleFonts.poppins(fontWeight: FontWeight.w900, fontSize: 16)),
              ],
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
          color: Colors.deepPurple,
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
