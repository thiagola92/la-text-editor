# Instructions

* Eu vou referênciar a teclas utilizando o formato de "uma linha de código" do Markdown.  
  * tecla `y`, tecla `p`, tecla `d`, tecla `;`...  
* Vai ser sensível a caracter, ou seja, apertar `d` é diferente de apertar `D` (shift + d)  
  * tecla `Y`, tecla `P`, tecla `D`, tecla `:`...  
* Se a tecla não for uma letra apenas, vou escrever o nome da tecla entre "<" e ">".  
  * tecla `<up>`, tecla `<down>`, tecla `<esc>`...  
* Essas teclas podem estar em maiúsculo caso inclua o `<shift>` estar apertado.
  * tecla `<UP>`, tecla `<DOWN>`, tecla `<ESC>`...  
* Apertar uma combinação de teclas ao mesmo tempo vai ser representado com um sinal de + fora da formatação de tecla.  
  * teclas `<ctrl>` + `w`...  
* Apertar uma sequência de teclas vai ser representado com virgulas entre elas.  
  * apertar teclas `y`, `d`, `p`, apertar teclas `:`, `q`, `!`...  
  * isso quer dizer que você precisa soltar a(s) tecla(s) anterior antes de apertar a próxima.
* Qualquer outro caso eu tentarei deixar claro o que você deve apertar.  

# Glossary

Quando utilizando uma destas palavras, vou estar me referindo a um significado específico.  

| Palavra     | Significado                                                |
| ----------- | ---------------------------------------------------------- |
| palavra     | conjunto dos characters `a`-`z`, `A`-`Z`, `0`-`9`, `_`     |
| texto       | conjunto de characters não brancos                         |
| linha       | conjunto de texto entre o charactere `\n`                  |
| destacado   | palavra na qual o cursor se encontra                       |
| duplicata   | palavra idêntica â destacada                               |
| selecionado | texto atualmente selecionado                               |
| copiado     | último texto copiado                                       |
| grupo       | agrupamento de tabs                                        |

# Normal mode

Atalhos relacionados ao editor de texto.  

> Extensões/plugins devem adicionar atalhos em outro modo!  

| Atalho         | Ação                        | Selecionado | Novo Modo    | Tip       | Done |
| -------------- | ----------------------------| :---------: | :----------: | -------   | ---- |
| `<ctrl>` + `a` | selecionar tudo             |             |              | All       | x    |
| `<ctrl>` + `A` | TODO                        |             |              |           |      |
| `<ctrl>` + `b` | TODO                        |             |              |           |      |
| `<ctrl>` + `B` | TODO                        |             |              | Copy      |      |
| `<ctrl>` + `c` | copiar linha                |             |              | Copy      | x    |
| `<ctrl>` + `c` | copiar selecionado          | x           |              | Copy      | x    |
| `<ctrl>` + `C` | copiar até character        |             | movimentação | Copy      |      |
| `<ctrl>` + `d` | selecionar destacado        |             |              | Duplicate | x    |
| `<ctrl>` + `d` | selecionar duplicata        | x           |              | Duplicate | x    |
| `<ctrl>` + `D` | selecionar duplicatas       |             |              | Duplicate |      |
| `<ctrl>` + `e` | expandir escopo             |             | expansão lvl | Expand    |      |
| `<ctrl>` + `E` | expandir global             |             | expansão lvl | Expand    |      |
| `<ctrl>` + `f` | buscar no arquivo           |             | busca        | Find      |      |
| `<ctrl>` + `f` | buscar texto no arquivo     | x           | busca        | Find      |      |
| `<ctrl>` + `F` | buscar no projeto           |             | busca        | Find      |      |
| `<ctrl>` + `F` | buscar texto no projeto     | x           | busca        | Find      |      |
| `<ctrl>` + `g` | ir para linha               |             | movimentação | Go to     |      |
| `<ctrl>` + `G` | ir para character           |             | movimentação | Go to     |      |
| `<ctrl>` + `h` | dividir horizontal          |             |              | Half      |      |
| `<ctrl>` + `H` | dividir vertical            |             |              | Half      |      |
| `<ctrl>` + `j` | TODO                        |             |              |           |      |
| `<ctrl>` + `J` | TODO                        |             |              |           |      |
| `<ctrl>` + `k` | TODO                        |             |              |           |      |
| `<ctrl>` + `K` | TODO                        |             |              |           |      |
| `<ctrl>` + `l` | TODO                        |             |              |           |      |
| `<ctrl>` + `L` | TODO                        |             |              |           |      |
| `<ctrl>` + `m` | mover foco para grupo       |             | grupo        | Move      |      |
| `<ctrl>` + `M` | mover tab para grupo        |             | grupo        | Move      |      |
| `<ctrl>` + `n` | nova tab                    |             |              | New       | x    |
| `<ctrl>` + `N` | nova janela                 |             |              | New       | x    |
| `<ctrl>` + `o` | abrir arquivo               |             |              | Open      | x    |
| `<ctrl>` + `O` | abrir projeto               |             |              | Open      |      |
| `<ctrl>` + `p` | escolher comando            |             | paleta       | Pallet    |      |
| `<ctrl>` + `P` | escolher modo               |             | paleta       | Pallet    |      |
| `<ctrl>` + `q` | fechar editor               |             |              | Quit      | x    |
| `<ctrl>` + `Q` | DONT                        |             |              |           |      |
| `<ctrl>` + `r` | substituir no arquivo       |             | busca        | Replace   |      |
| `<ctrl>` + `r` | substituir texto no arquivo | x           | busca        | Replace   |      |
| `<ctrl>` + `R` | substituir no projeto       |             | busca        | Replace   |      |
| `<ctrl>` + `R` | substituir texto no projeto | x           | busca        | Replace   |      |
| `<ctrl>` + `s` | salvar arquivo              |             |              | Save      | x    |
| `<ctrl>` + `S` | salvar projeto              |             |              | Save      |      |
| `<ctrl>` + `t` | abrir tab                   |             | fuzzy finder | Tab       |      |
| `<ctrl>` + `T` | reabrir tab                 |             |              | Tab       |      |
| `<ctrl>` + `u` | TODO                        |             |              |           |      |
| `<ctrl>` + `U` | TODO                        |             |              |           |      |
| `<ctrl>` + `v` | colar copiado               |             |              |           | x    |
| `<ctrl>` + `V` | colar antes do character    |             | movimentação |           |      |
| `<ctrl>` + `w` | fechar tab                  |             |              |           | x    |
| `<ctrl>` + `W` | fechar janela               |             |              |           | x    |
| `<ctrl>` + `x` | recortar linha              |             |              |           | x    |
| `<ctrl>` + `x` | recortar selecionado        | x           |              |           | x    |
| `<ctrl>` + `X` | recortar até character      |             | movimentação |           |      |
| `<ctrl>` + `y` | TODO                        |             |              |           |      |
| `<ctrl>` + `Y` | TODO                        |             |              |           |      |
| `<ctrl>` + `z` | desfazer                    |             |              |           | x    |
| `<ctrl>` + `Z` | refazer                     |             |              |           | x    |

| Atalho          | Ação                        | Selecionado | Novo Modo    | Done |
| --------------- | --------------------------- | :---------: | :----------: | ---- |
| `<ctrl>` + `'`  | TODO                        |             |              |      |
| `<ctrl>` + `"`  | TODO                        |             |              |      |
| `<ctrl>` + `1`  | TODO                        |             |              |      |
| `<ctrl>` + `!`  | TODO                        |             |              |      |
| `<ctrl>` + `2`  | TODO                        |             |              |      |
| `<ctrl>` + `@`  | TODO                        |             |              |      |
| `<ctrl>` + `3`  | TODO                        |             |              |      |
| `<ctrl>` + `#`  | TODO                        |             |              |      |
| `<ctrl>` + `4`  | TODO                        |             |              |      |
| `<ctrl>` + `$`  | TODO                        |             |              |      |
| `<ctrl>` + `5`  | TODO                        |             |              |      |
| `<ctrl>` + `%`  | TODO                        |             |              |      |
| `<ctrl>` + `6`  | TODO                        |             |              |      |
| `<ctrl>` + `¨`  | TODO                        |             |              |      |
| `<ctrl>` + `7`  | TODO                        |             |              |      |
| `<ctrl>` + `&`  | TODO                        |             |              |      |
| `<ctrl>` + `8`  | TODO                        |             |              |      |
| `<ctrl>` + `*`  | TODO                        |             |              |      |
| `<ctrl>` + `9`  | TODO                        |             |              |      |
| `<ctrl>` + `(`  | TODO                        |             |              |      |
| `<ctrl>` + `0`  | TODO                        |             |              |      |
| `<ctrl>` + `)`  | TODO                        |             |              |      |
| `<ctrl>` + `-`  | zoom out                    |             |              |      |
| `<ctrl>` + `_`  | TODO                        |             |              |      |
| `<ctrl>` + `=`  | zoom in                     |             |              |      |
| `<ctrl>` + `+`  | zoom reset                  |             |              |      |
| `<ctrl>` + `´`  | TODO                        |             |              |      |
| `<ctrl>` + `` ` `` | TODO                        |             |              |      |
| `<ctrl>` + `[`  | TODO                        |             |              |      |
| `<ctrl>` + `{`  | TODO                        |             |              |      |
| `<ctrl>` + `~`  | TODO                        |             |              |      |
| `<ctrl>` + `^`  | TODO                        |             |              |      |
| `<ctrl>` + `]`  | TODO                        |             |              |      |
| `<ctrl>` + `}`  | TODO                        |             |              |      |
| `<ctrl>` + `,`  | TODO                        |             |              |      |
| `<ctrl>` + `<`  | TODO                        |             |              |      |
| `<ctrl>` + `.`  | TODO                        |             |              |      |
| `<ctrl>` + `>`  | TODO                        |             |              |      |
| `<ctrl>` + `;`  | TODO                        |             |              |      |
| `<ctrl>` + `:`  | TODO                        |             |              |      |
| `<ctrl>` + `/`  | comment code                |             |              |      |
| `<ctrl>` + `?`  | TODO                        |             |              |      |
| `<ctrl>` + `\`  | TODO                        |             |              |      |
| `<ctrl>` + `\|`  | TODO                        |             |              |      |

| Atalho                | Ação                      | Selecionado | Novo Modo    | Done |
| --------------------- | ------------------------- | :---------: | :----------: | ---- |
| `<ctrl>` + `<enter>`  | inserir linha abaixo      |             |              |      |
| `<ctrl>` + `<ENTER>`  | inserir linha acima       |             |              |      |
| `<ctrl>` + `<pgdown>` | mover tab para direita    |             |              |      |
| `<ctrl>` + `<PGDOWN>` | selecionar tab à direita  |             |              |      |
| `<ctrl>` + `<pgup>`   | mover tab para esquerda   |             |              |      |
| `<ctrl>` + `<PGUP>`   | selecionar tab à esquerda |             |              |      |
| `<ctrl>` + `<space>`  | exibir sugestões          |             |              |      |
| `<ctrl>` + `<SPACE>`  | exibir alternativas       | x           |              |      |
| `<ctrl>` + `<tab>`    | focar próxima tab         |             |              | x    |
| `<ctrl>` + `<TAB>`    | focar tab anterior        |             |              | x    |

| Atalho                | Ação                      | Selecionado | Novo Modo    | Done |
| --------------------- | ------------------------- | :---------: | :----------: | ---- |
| `F1`                  |                           |             |              |      |
| `F2`                  |                           |             |              |      |
| `F3`                  |                           |             |              |      |
| `F4`                  |                           |             |              |      |
| `F5`                  |                           |             |              |      |
| `F6`                  |                           |             |              |      |
| `F7`                  |                           |             |              |      |
| `F8`                  |                           |             |              |      |
| `F9`                  |                           |             |              |      |
| `F11`                 |                           |             |              |      |
| `F12`                 |                           |             |              |      |

# Tree mode

Atalhos para utilizar quando tiver exibindo a árvore do projeto.  

# Movimentation mode

Atalhos não devem precisar `<ctrl>` pois usuários não vão estar escrevendo texto.  
Ele vai apenas ditar como se movimentar.  

| Atalho         | Ação                                  | Selecionado | Novo Modo    | Done |
| -------------- | ------------------------------------- | :---------: | :----------: | ---- |
| `<enter>`      | confirma nova posição                 |             | normal       |      |
| `<up>`         | ir para linha relativa em cima        |             |              |      |
| `<down>`       | ir para linha relativa em baixo       |             |              |      |
| `<right>`      | muda orientação de char para direita  |             |              |      |
| `<down>`       | muda orientação de char para esquerda |             |              |      |
| `<esc>`        | sai do modo                           |             | normal       |      |

# Search mode

| Atalho               | Ação                                  | Selecionado | Novo Modo    | Done |
| -------------------- | ------------------------------------- | :---------: | :----------: | ---- |
| `<ctrl>` + `<enter>` | move para próximo resultado           |             |              |      |
| `<ctrl>` + `<ENTER>` | move para resultado anterior          |             |              |      |
| `<esc>`              | sai do modo                           |             | normal       |      |

# References
- https://en.wikipedia.org/wiki/Language_Server_Protocol
- https://en.wikipedia.org/wiki/Intelligent_code_completion
- https://en.wikipedia.org/wiki/Lint_(software)
