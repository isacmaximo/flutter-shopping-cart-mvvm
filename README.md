# Simulação de Carrinho de E-commerce (MVVM)

Este é um aplicativo de simulação de carrinho de e-commerce desenvolvido em Flutter. O projeto foi estruturado utilizando a arquitetura **MVVM (Model-View-ViewModel)** e utiliza dados locais (em memória) para demonstrar o fluxo de dados e o gerenciamento de estado.

## 🚀 Processo de Construção

Estes foram os passos seguidos para a elaboração da aplicação:

1.  Análise de regras para definição da estrutura (MVVM).
2.  Elaboração da camada de Dados (Data) e Domínio (Domain).
3.  Elaboração do Tema (estilo geral da aplicação).
4.  Início da elaboração da camada de Apresentação (Presenter).
5.  Implementação da feature de Produtos.
6.  Implementação da feature de Carrinho + Checkout.
7.  Reajustes finais.

---

## 🏛️ Arquitetura (MVVM)

A arquitetura MVVM foi utilizada para estruturar o projeto, separando responsabilidades. O fluxo de dados, da camada de dados para a de apresentação, funciona da seguinte forma:

### 1. Camada de Dados (Data Layer)

* **Service:** Pega os dados brutos (simulando um JSON de uma API) e os transforma em um **DTO (Data Transfer Object)**. O DTO é uma representação pura do objeto, sem regras de negócio.
* **RepositoryImpl:** É a implementação concreta do `Repository`. Ele consome o `Service` e é responsável por transformar os **DTOs** em **Entidades (Entities)**.

### 2. Camada de Domínio (Domain Layer)

* **Repository (Abstração):** Define o "contrato" (interface) que a camada de dados deve seguir.
* **Entity:** São as classes que representam os objetos de interesse da regra de negócio.
* **Use Cases (Casos de Uso):** Contêm regras de negócio específicas e chamam métodos do `Repository` (abstração). São usados para casos específicos.

### 3. Camada de Apresentação (Presenter Layer)

* **ViewModel (ou Controller):** Utiliza os `Use Cases` e aplica lógicas de apresentação (formatação, controle de estado da tela) para a `View`.
* **View (Tela):** É a interface do usuário. Ela "ouve" as mudanças no `ViewModel` e envia eventos (como cliques de botão) para o `ViewModel` para disparar ações.

---

## 💻 Tecnologias Utilizadas

* **Flutter:** `3.35.6`
* **Plataforma Testada:** `Android`

---

## ▶️ Como Executar

Siga as instruções abaixo para rodar o projeto localmente:

1.  **Baixar dependências**
    ```bash
    flutter pub get
    ```

2.  **Verificar dispositivos conectados** (O nome/ID do dispositivo aparecerá na segunda coluna)
    ```bash
    flutter devices
    ```

3.  **Rodar a aplicação** (Substitua `<nome_do_dispositivo>` pelo ID do seu device ou emulador)
    ```bash
    flutter run -d <nome_do_dispositivo>
    ```
