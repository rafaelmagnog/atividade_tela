import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/hero_image.dart';
import '../widgets/action_buttons.dart';
import '../widgets/pessoas_encontradas.dart';

class ViagensPage extends StatelessWidget {
  const ViagensPage({super.key});

  static const String _paragrafo =
      'O Coliseu é o maior anfiteatro já construído na história, localizado no centro de Roma, na Itália. Erguido entre os anos 70 e 80 d.C., chegou a comportar até 80 mil espectadores que assistiam a gladiadores, combates de animais e encenações históricas. Considerado uma das sete maravilhas do mundo moderno, o monumento resistiu a séculos de terremotos e saques, tornando-se o símbolo mais icônico da civilização romana. Hoje recebe milhões de visitantes por ano e segue de pé como testemunho da grandiosidade do Império Romano.';

  void _mostrarMensagem(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Viagens', style: AppTextStyles.appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem com overlay
            const HeroImage(
              imagePath: 'assets/images/coliseu.jpg',
              city: 'Roma',
              place: 'Coliseu',
            ),

            // Botões de ação
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ActionButton(
                    icon: Icons.location_on,
                    label: 'Quero Ir',
                    onTap: () =>
                        _mostrarMensagem(context, 'Adicionado à sua lista!'),
                  ),
                  ActionButton(
                    icon: Icons.check_circle_outline,
                    label: 'Já Fui',
                    onTap: () =>
                        _mostrarMensagem(context, 'Marcado como visitado!'),
                  ),
                  ActionButton(
                    icon: Icons.share,
                    label: 'Compartilhar',
                    onTap: () => _mostrarMensagem(context, 'Compartilhando...'),
                  ),
                  StarsButton(
                    label: 'Avaliações',
                    starCount: 3,
                    onTap: () =>
                        _mostrarMensagem(context, 'Abrindo avaliações...'),
                  ),
                ],
              ),
            ),

            // Parágrafo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                _paragrafo,
                style: AppTextStyles.paragraph,
                textAlign: TextAlign.justify,
              ),
            ),

            const SizedBox(height: 20),

            // Seção pessoas encontradas
            const PessoasEncontradas(),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
