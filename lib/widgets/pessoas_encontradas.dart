import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class PessoasEncontradas extends StatelessWidget {
  const PessoasEncontradas({super.key});

  void _abrirFiltro(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const _FilterBottomSheet(),
    );
  }

  void _abrirPerfil(BuildContext context, int index) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Perfil da pessoa ${index + 1}')));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cabeçalho com opção filtro
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pessoas Encontradas',
                style: AppTextStyles.sectionTitle,
              ),
              InkWell(
                onTap: () => _abrirFiltro(context),
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.filter_list,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text('Filtrar', style: AppTextStyles.filterLabel),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // Avatares clicáveis
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => InkWell(
                onTap: () => _abrirPerfil(context, index),
                borderRadius: BorderRadius.circular(34),
                child: const CircleAvatar(
                  radius: 34,
                  backgroundColor: AppColors.avatarBackground,
                  child: Icon(Icons.person, size: 38, color: AppColors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Tela flutuante de filtros
class _FilterBottomSheet extends StatefulWidget {
  const _FilterBottomSheet();

  @override
  State<_FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<_FilterBottomSheet> {
  String _ordenacao = 'Relevância';
  bool _soConhecidos = false;
  bool _soMesmaIdade = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho - filtro
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filtrar pessoas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const Divider(),
          const SizedBox(height: 8),

          // filtro - Ordenar por
          const Text(
            'Ordenar por',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: ['Relevância', 'Mais próximos', 'Mais recentes']
                .map(
                  (opcao) => ChoiceChip(
                    label: Text(opcao),
                    selected: _ordenacao == opcao,
                    selectedColor: AppColors.primary,
                    labelStyle: TextStyle(
                      color: _ordenacao == opcao
                          ? AppColors.white
                          : AppColors.primary,
                    ),
                    onSelected: (_) => setState(() => _ordenacao = opcao),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 16),

          // filtro - Switches
          SwitchListTile(
            value: _soConhecidos,
            onChanged: (v) => setState(() => _soConhecidos = v),
            title: const Text('Somente conhecidos'),
            activeColor: AppColors.primary,
            contentPadding: EdgeInsets.zero,
          ),
          SwitchListTile(
            value: _soMesmaIdade,
            onChanged: (v) => setState(() => _soMesmaIdade = v),
            title: const Text('Mesma faixa etária'),
            activeColor: AppColors.primary,
            contentPadding: EdgeInsets.zero,
          ),

          const SizedBox(height: 12),

          // filtro - Botão aplicar
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Aplicar filtros'),
            ),
          ),
        ],
      ),
    );
  }
}
