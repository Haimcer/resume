# Allan Portfolio (Flutter Web)

Site de portfólio em **Flutter** (tema dark, Material 3, cards arredondados), com:
- Seções de header, interesses, experiência, skills, educação, idiomas e links.
- Botão **Download Résumé (HTML)** (gera currículo pronto para impressão).
- Ícones automáticos da App Store em links iOS (via iTunes Search API).

## Como rodar
1. Tenha **Flutter 3.x+** instalado.
2. Abra o projeto na raiz (mesma pasta do `pubspec.yaml`).
3. Rode:
   ```bash
   flutter pub get
   flutter run -d chrome
   ```
4. Build de produção:
   ```bash
   flutter build web
   ```

## Build de produção (com base-href para GitHub Pages)
> Se o nome do repositório for `resume`, use `--base-href /resume/`.  
> Troque `resume` pelo **nome exato** do repo.

```bash
flutter build web --release --base-href /<nome-do-repo>/
```

## Publicar no GitHub Pages (via `/docs`)
1. Copie o **conteúdo** de `build/web` para uma pasta **`docs/`** na raiz do repositório.
2. Faça commit/push.
3. Em **Settings → Pages**:
   - **Source**: *Deploy from a branch*
   - **Branch**: `main`
   - **Folder**: `/docs`
4. Acesse: `https://<seu-usuário>.github.io/<nome-do-repo>/`

> **Dica:** tela branca/404 quase sempre é `--base-href` incorreto. Refaça o build com o nome certo do repo.

## Personalização rápida
Edite **`lib/data/profile_data.dart`**:
- **name**, **headline** e **about**
- **interests**
- **experiences** (empresa, cargo, período, bullets, ferramentas)
- **skills** (tech e toolstack)
- **education**
- **links** (GitHub, LinkedIn, Play Store, App Store etc.)
- **languages** e **details** (email, telefone, localização)

> O botão **“Download Résumé (HTML)”** usa esses mesmos dados para gerar o currículo.

## Estrutura do projeto
```
lib/
  core/
    models/            # ProfileData, Experience, etc.
    theme/             # Tema (Material 3, cores, tipografia)
  data/
    profile_data.dart  # Seus dados
  features/
    portfolio/
      pages/           # PortfolioPage
      widgets/         # Cards e componentes
  platform/
    resume_downloader.dart       # API única
    resume_downloader_web.dart   # implementação web (download HTML)
    resume_downloader_stub.dart  # no-op fora do web
  services/
    resume_builder.dart          # gera HTML do currículo
    apple_artwork_icon.dart      # artwork da App Store
    launcher.dart                # abrir links externos
  shared/widgets/                # AppCard, ChipTag, TitleText
web/
  index.html                     # com <base href="$FLUTTER_BASE_HREF">
```

## Stack / Pacotes
- `google_fonts` (Inter)
- `url_launcher` (abrir links externos)
- `http` (buscar artwork da App Store)

## Observações
- Projeto **Web-first**, mas pode ser adaptado para mobile/desktop.
- Para domínio próprio no Pages, crie um arquivo **CNAME** dentro de `/docs` com o domínio e aponte o DNS.
- Ícones PWA/manifest podem ser ajustados em `web/`.

Feito com ♥ em Flutter.
