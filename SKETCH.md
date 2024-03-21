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

| Atalho         | Ação                        | Selecionado | Novo Modo    | Done |
| -------------- | ----------------------------| :---------: | :----------: | ---- |
| `<ctrl>` + `a` | selecionar tudo             |             |              | x    |
| `<ctrl>` + `A` | TODO                        |             |              |      |
| `<ctrl>` + `b` | TODO                        |             |              |      |
| `<ctrl>` + `B` | TODO                        |             |              |      |
| `<ctrl>` + `c` | copiar linha                |             |              | x    |
| `<ctrl>` + `c` | copiar selecionado          | x           |              | x    |
| `<ctrl>` + `C` | copiar até character        |             | movimentação |      |
| `<ctrl>` + `d` | selecionar destacado        |             |              | x    |
| `<ctrl>` + `d` | selecionar duplicata        | x           |              | x    |
| `<ctrl>` + `D` | selecionar duplicatas       |             |              |      |
| `<ctrl>` + `e` | expandir escopo             |             | expansão lvl |      |
| `<ctrl>` + `E` | expandir global             |             | expansão lvl |      |
| `<ctrl>` + `f` | buscar no arquivo           |             | busca        |      |
| `<ctrl>` + `f` | buscar texto no arquivo     | x           | busca        |      |
| `<ctrl>` + `F` | buscar no projeto           |             | busca        |      |
| `<ctrl>` + `F` | buscar texto no projeto     | x           | busca        |      |
| `<ctrl>` + `g` | ir para linha               |             | movimentação |      |
| `<ctrl>` + `G` | ir para character           |             | movimentação |      |
| `<ctrl>` + `h` | TODO                        |             |              |      |
| `<ctrl>` + `H` | TODO                        |             |              |      |
| `<ctrl>` + `j` | TODO                        |             |              |      |
| `<ctrl>` + `J` | TODO                        |             |              |      |
| `<ctrl>` + `k` | TODO                        |             |              |      |
| `<ctrl>` + `K` | TODO                        |             |              |      |
| `<ctrl>` + `l` | TODO                        |             |              |      |
| `<ctrl>` + `L` | TODO                        |             |              |      |
| `<ctrl>` + `m` | mover foco para grupo       |             | grupo        |      |
| `<ctrl>` + `M` | mover tab para grupo        |             | grupo        |      |
| `<ctrl>` + `n` | nova tab                    |             |              | x    |
| `<ctrl>` + `N` | nova janela                 |             |              |      |
| `<ctrl>` + `o` | abrir arquivo               |             |              |      |
| `<ctrl>` + `O` | abrir projeto               |             |              |      |
| `<ctrl>` + `p` | escolher comando            |             | paleta       |      |
| `<ctrl>` + `P` | escolher modo               |             | paleta       |      |
| `<ctrl>` + `q` | TODO                        |             |              |      |
| `<ctrl>` + `Q` | TODO                        |             |              |      |
| `<ctrl>` + `r` | substituir no arquivo       |             | busca        |      |
| `<ctrl>` + `r` | substituir texto no arquivo | x           | busca        |      |
| `<ctrl>` + `R` | substituir no projeto       |             | busca        |      |
| `<ctrl>` + `R` | substituir texto no projeto | x           | busca        |      |
| `<ctrl>` + `s` | salvar arquivo              |             |              |      |
| `<ctrl>` + `S` | salvar projeto              |             |              |      |
| `<ctrl>` + `t` | abrir tab                   |             | fuzzy finder |      |
| `<ctrl>` + `T` | reabrir tab                 |             |              |      |
| `<ctrl>` + `u` | TODO                        |             |              |      |
| `<ctrl>` + `U` | TODO                        |             |              |      |
| `<ctrl>` + `v` | colar copiado               |             |              | x    |
| `<ctrl>` + `V` | colar antes do character    |             | movimentação |      |
| `<ctrl>` + `w` | fechar tab                  |             |              |      |
| `<ctrl>` + `W` | fechar janela               |             |              |      |
| `<ctrl>` + `x` | recortar linha              |             |              | x    |
| `<ctrl>` + `x` | recortar selecionado        | x           |              | x    |
| `<ctrl>` + `X` | recortar até character      |             | movimentação |      |
| `<ctrl>` + `y` | TODO                        |             |              |      |
| `<ctrl>` + `Y` | TODO                        |             |              |      |
| `<ctrl>` + `z` | desfazer                    |             |              | x    |
| `<ctrl>` + `Z` | refazer                     |             |              | x    |

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
| `<ctrl>` + `<tab>`    | focar próxima tab         |             |              |      |
| `<ctrl>` + `<TAB>`    | focar tab anterior        |             |              |      |

# Movimentação mode

Don't use `<ctrl>` because it's not like the user going to insert words.  

| Atalho         | Ação                                  | Selecionado | Novo Modo    | Done |
| -------------- | ------------------------------------- | :---------: | :----------: | ---- |
| `<enter>`      | confirma nova posição                 |             | normal       |      |
| `<up>`         | ir para linha relativa em cima        |             |              |      |
| `<down>`       | ir para linha relativa em baixo       |             |              |      |
| `<right>`      | muda orientação de char para direita  |             |              |      |
| `<down>`       | muda orientação de char para esquerda |             |              |      |
| `<esc>`        | sai do modo                           |             | normal       |      |

# Busca mode

| Atalho               | Ação                                  | Selecionado | Novo Modo    | Done |
| -------------------- | ------------------------------------- | :---------: | :----------: | ---- |
| `<ctrl>` + `<enter>` | move para próximo resultado           |             |              |      |
| `<ctrl>` + `<ENTER>` | move para resultado anterior          |             |              |      |
| `<esc>`              | sai do modo                           |             | normal       |      |

# References
- https://en.wikipedia.org/wiki/Language_Server_Protocol
- https://en.wikipedia.org/wiki/Intelligent_code_completion
- https://en.wikipedia.org/wiki/Lint_(software)
