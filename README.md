# Allan Portfolio (Flutter Web)

Site de portfólio em Flutter no estilo dark e com cards arredondados.

## Como rodar
1. Tenha Flutter SDK instalado (3.x+).
2. Abra este projeto na raiz (mesma pasta do `pubspec.yaml`).
3. Rode:
   ```bash
   flutter pub get
   flutter run -d chrome
   ```
4. Para build de produção:
   ```bash
   flutter build web
   ```

## Personalização rápida
Edite os dados no início de `lib/main.dart` (variável `data`):
- Nome, headline e texto de sobre
- Lista de interesses
- Experiências (empresa, cargo, período, bullets, ferramentas)
- Stack (tech e tools)
- Educação
- Links (GitHub, LinkedIn, Play Store, YouTube, etc.)
- Idiomas e detalhes (email, WhatsApp, localização)

## Observações
- O projeto é *Web-first*, mas pode ser adaptado para mobile/desktop.
- Ícones PWA são placeholders simples (podem ser trocados em `web/icons`).

Feito com ♥ em Flutter.
