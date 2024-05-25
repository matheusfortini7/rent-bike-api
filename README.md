# README

Essa API foi construída a fim de viabilizar a criação de um fluxo de gestão para aluguel de bicicletas.

## Enpoints

1. Cadastro de bikes

- URL: /api/v1/bikes
- Método: POST
- Descrição: Realiza a criação de bicicletas no estoque
- Parâmetros: "brand", "model" e "color"
- Exemplo de requisição: curl -X POST http://localhost:3000/api/v1/bikes -H "Content-Type: application/json" -d '{"brand": "Caloi", "model": "C1000", "color": "blue"}'
