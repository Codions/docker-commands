# Docker Commands
Este conjunto de scripts permite que você utilize atalhos para substituir os comandos no terminal como o `php` e `node` utilizando uma versões baseadas em containers. O único objetivo é simplificar a execução de tasks como [composer](https://getcomposer.org), [npm](https://www.npmjs.com), entre outras ou simplismente executar algum arquivo `php` ou `js` pelo terminal sem a necessidade de entrar nos containers em execução todas as vezes.

## Importante
Este projeto possui partes do repositório [codecasts/ambientum](https://github.com/codecasts/ambientum)

## Tabela de referência
| Atalho | Comando | Imagem utilizada                                          | Tag  |
| ------ | ------- | --------------------------------------------------------- | ---- |
| p      | php     | [codions/php](https://hub.docker.com/r/codions/php)       | 7.1  |
| n      | node    | [codions/nodejs](https://hub.docker.com/r/codions/nodejs) | 9    |

### Substituindo comandos locais:
Há um conjunto de atalhos que podem ajudar com essa tarefa, mas para isso será necessário fazer a instalação

#### Instalação:
```
curl -sSL https://raw.githubusercontent.com/codions/docker-commands/master/setup.sh | bash
```

Depois de fazer a instalação dos comandos, seguindo as instruções acima, você poderá usá-los imediatamente.

#### Importante: A primeira execução pode levar algum tempo, uma vez que irá baixar as imagens

Tudo que for relacionado ao Node.JS pode ser executado prefixando o comando `n`. Por exemplo, digamos que precisamos instalar o Gulp
```
n npm install -g gulp
n gulp --version
```

Tudo relacionado ao PHP pode ser executado prefixando o comando `p`. Por exemplo, digamos que queremos executar o composer

```
p composer global require some/package-here
```

Executar um comando através do Laravel [Artisan](https://laravel.com/docs/5.6/artisan):
```
p php artisan tinker
```

Ou até mesmo executar um único arquivo com PHP:
```
p php test.php
```


## Contribuição

1. Fork este repositório!
2. Crie sua feature a partir da branch **develop**: `git checkout -b feature/my-new-feature`
3. Escreva e comente seu código.
4. Commit suas alterações: `git commit -am 'Add some feature'`
5. Faça um `push` para a branch: `git push origin feature/my-new-feature`
6. Faça um `pull request` para a branch **develop**

## Créditos

[Fábio Assunção](https://github.com/fabioassuncao) e todos os [contribuidores](https://github.com/codions/docker-commands/graphs/contributors).

## Licença

Licenciado sob a licença MIT.
