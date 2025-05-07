import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:delivery_manager/l10n/l10n.dart' as l10n;
import 'package:delivery_manager/providers/locale_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.language),
            trailing: DropdownButton<Locale>(
              value: locale,
              onChanged: (newLocale) {
                provider.setLocale(newLocale!);
              },
              items: l10n.L10n.all.map(
                (locale) {
                  final flag = l10n.L10n.getFlag(locale.languageCode);
                  return DropdownMenuItem(
                    value: locale,
                    child: Text(flag),
                  );
                },
              ).toList(),
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.autoDetectCurrency),
          ),
        ],
      ),
    );
  }
}
