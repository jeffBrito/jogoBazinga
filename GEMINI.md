# ⚛️ Bazinga! - Pedra, Papel, Tesoura, Lagarto e Spock (The Big Bang Theory)

> Documentação oficial de regras de uso, engenharia de inteligência artificial da CPU, arquitetura de design responsivo e guia de configuração do projeto Flutter.

---

## 📑 Sumário
1. [Visão Geral](#-visão-geral)
2. [Regras Canônicas do Jogo (Sheldon Cooper)](#-regras-canônicas-do-jogo)
3. [Engenharia da CPU e Níveis de Dificuldade](#-engenharia-da-cpu-e-níveis-de-dificuldade)
4. [Melhorias de Design e Prevenção de Overflow](#-melhorias-de-design-e-prevenção-de-overflow)
5. [Arquitetura do Projeto](#-arquitetura-do-projeto)
6. [Guia de Configuração e Execução](#-guia-de-configuração-e-execução)

---

## 🛸 Visão Geral

O jogo **Bazinga!** é uma adaptação temática e interativa para Flutter do famoso jogo expandido de Sheldon Cooper (criado originalmente por Sam Kass e Karen Bryla e imortalizado na série *The Big Bang Theory*). O objetivo principal é derrotar a mente genial do **Sheldon Bot** em uma disputa melhor de 5 pontos.

---

## 📜 Regras Canônicas do Jogo

O jogo resolve as limitações de empate frequente do clássico *Pedra, Papel e Tesoura*, introduzindo duas novas variáveis: **Lagarto** e **Spock**.

Cada elemento vence exatamente 2 opções e é derrotado por outras 2 opções:

| Elemento | Vence (Ação / Verbo) | Vence (Ação / Verbo) | Perde Para |
| :--- | :--- | :--- | :--- |
| **Tesoura** ✂️ | Corta **Papel** | Decapita **Lagarto** | Pedra, Spock |
| **Papel** 📜 | Cobre **Pedra** | Refuta **Spock** | Tesoura, Lagarto |
| **Pedra** 🪨 | Esmaga **Lagarto** | Quebra **Tesoura** | Papel, Spock |
| **Lagarto** 🦎 | Envenena **Spock** | Devora **Papel** | Pedra, Tesoura |
| **Spock** 🖖 | Esmaga **Tesoura** | Vaporiza **Pedra** | Lagarto, Papel |

> *"Tesoura corta papel, papel cobre pedra, pedra esmaga lagarto, lagarto envenena Spock, Spock esmaga tesoura, tesoura decapita lagarto, lagarto devora papel, papel refuta Spock, Spock vaporiza pedra e, como sempre, pedra quebra tesoura."*  
> — **Dr. Sheldon Cooper**

---

## 🧠 Engenharia da CPU e Níveis de Dificuldade

O motor de IA da CPU foi projetado no serviço [`CpuAiService`](file:///c:/Users/jeff-dev/Desktop/Jogos%20Dev/jogoBazinga/lib/services/cpu_ai_service.dart) com base em conceitos de **Teoria dos Jogos**, **Cadeias de Transição de Markov** e **Psicologia Comportamental humana**.

### 1. Modo Fácil (Sheldon Distraído)
* **Comportamento**: A CPU comete erros estratégicos frequentes.
* **Lógica**: Em **55% das vezes**, a CPU intencionalmente escolhe um movimento que *perde* para a última escolha do jogador. Nos outros 45%, joga aleatoriamente.
* **Objetivo**: Ideal para crianças ou novos jogadores aprenderem a dinâmica sem frustração.

### 2. Modo Normal (Leonard Equilibrado)
* **Comportamento**: Disputa justa, equilibrada e humana.
* **Lógica**: Distribuição uniforme equiprovável ($P = 20\%$ para cada um dos 5 elementos), com algoritmo de suavização que impede a CPU de repetir o mesmo movimento 3 vezes consecutivas.

### 3. Modo Difícil (Sheldon QI 187 - Bazinga Master!)
* **Comportamento**: IA preditiva e adaptativa de alta eficiência.
* **Algoritmos Aplicados**:
  1. **Matriz de Transição de Markov**: Quando há histórico $\ge 3$ rodadas, a CPU analisa qual elemento o jogador costuma lançar logo após o elemento atual.
  2. **Heurística Psicológica Win-Stay, Lose-Shift**:
     * Se o jogador **venceu** a rodada anterior, ele tem alta tendência estatística ($\sim 65\%$) a repetir a mesma jogada vitoriosa.
     * Se o jogador **perdeu**, quase nunca repete a mesma jogada perdedora; humanos tendem a selecionar o elemento que teria derrotado a jogada anterior da CPU!
  3. **Contra-Ataque com Margem de Caos**: A CPU calcula a jogada prevista do jogador e seleciona um dos dois elementos que vencem essa previsão. É mantida uma taxa estocástica de $20\%$ para que o jogo continue orgânico e imprevisível.
  4. **Diálogos de Sheldon Cooper**: A CPU interage em tempo real com falas clássicas de Sheldon de acordo com vitórias (*"Bazinga! Seu padrão de jogo é dolorosamente previsível!"*), derrotas (*"Inaceitável! Claramente uma anomalia estatística quântica!"*) e empates (*"Um impasse de Schrödinger!"*).

---

## 🎨 Melhorias de Design e Prevenção de Overflow

Para garantir fluidez, estética moderna e responsividade total em qualquer resolução ou orientação de tela:

1. **Eliminação Radical de Erros de Overflow**:
   * Substituição de `Column` estáticas por `LayoutBuilder` combinado com `SingleChildScrollView(physics: BouncingScrollPhysics())` e `ConstrainedBox(minHeight: constraints.maxHeight)`.
   * Proporções de tamanho calculadas dinamicamente via `.clamp(min, max)` com base no espaço disponível.
   * Seleção horizontal dos cards de movimento (`MoveCard`) envolvida em scroll suave com padding adaptativo.
2. **Estética Visual Cósmica e Bazinga**:
   * **Gradientes Temáticos**: Deep Cosmic Indigo (`#140E36` $\rightarrow$ `#272362` $\rightarrow$ `#0F0B29`), além de gradientes de vitória (`#1B4332`) e derrota (`#49111C`).
   * **Cards com Efeito Glow**: Sombras coloridas sincronizadas com o elemento em destaque (`glowShadow`).
3. **Animações Fluidas**:
   * **Arena de Batalha com Suspense**: Contagem e tremor sutil de 700ms ao escolher uma jogada antes da CPU revelar sua carta.
   * **Feedback Tátil**: Botões com micro-animação `AnimatedScale` que comprimem suavemente ao toque.
   * **Pulsar do Logo**: Logo animado no menu principal para dar sensação de vida à interface.
   * **Transição de Placar**: `AnimatedSwitcher` com `ScaleTransition` para os números do placar.

---

## 🏛️ Arquitetura do Projeto

```
lib/
├── main.dart                      # Ponto de entrada, orientação de tela e AppTheme
├── models/
│   ├── game_move.dart             # Enum dos 5 movimentos, regras de vitória e verbos
│   └── game_difficulty.dart       # Enum de dificuldades (Fácil, Normal, Difícil)
├── services/
│   └── cpu_ai_service.dart        # IA da CPU, predição de Markov e diálogos de Sheldon
├── theme/
│   └── app_theme.dart             # Cores cósmicas, gradientes, sombras e ThemeData
├── widgets/
│   ├── bazinga_button.dart        # Botão moderno com escala elástica e gradientes
│   ├── move_card.dart             # Card circular do movimento com borda neon iluminada
│   ├── difficulty_selector.dart   # Seletor interativo em formato card/pill
│   └── battle_arena.dart          # Arena animada de duelo (Você vs Sheldon CPU)
└── screens/
    ├── home_page.dart             # Menu principal com seleção de dificuldade e logo
    ├── start_game.dart            # Arena principal da partida com placar e rodadas
    ├── rules_page.dart            # Tela com AppBar temático e regras
    ├── item_rules.dart            # Lista de regras interativa com filtros por elemento
    ├── winner.dart                # Tela de vitória (Troféu, estatísticas e Bazinga!)
    ├── over.dart                  # Tela de derrota (GameOver, estatísticas e revanche)
    └── select_icon.dart           # Componente auxiliar de ícones
```

---

## 🚀 Guia de Configuração e Execução

### Pré-requisitos
* Flutter SDK (3.x ou superior)
* Dart SDK (3.x ou superior)

### 1. Obter Dependências
No terminal do projeto:
```bash
flutter pub get
```

### 2. Validação do Código
Para garantir que não há erros estáticos:
```bash
flutter analyze
```

### 3. Execução do Jogo
Para rodar no dispositivo conectado, emulador ou navegador:
```bash
flutter run
```

---

*Que a física teórica esteja a seu favor! BAZINGA! 🖖*
