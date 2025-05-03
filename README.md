# abap-rap
Exemplo de ABAP RAP

[![GitHub forks](https://img.shields.io/github/forks/edmilson-nascimento/ABAP-Unit-Tests?style=social)](https://github.com/edmilson-nascimento/ABAP-Unit-Tests/network/members)
[![GitHub stars](https://img.shields.io/github/stars/edmilson-nascimento/ABAP-Unit-Tests?style=social)](https://github.com/edmilson-nascimento/ABAP-Unit-Tests/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/edmilson-nascimento/ABAP-Unit-Tests)](https://github.com/edmilson-nascimento/ABAP-Unit-Tests/issues)
[![GitHub license](https://img.shields.io/github/license/edmilson-nascimento/ABAP-Unit-Tests)](https://github.com/edmilson-nascimento/ABAP-Unit-Tests/blob/main/LICENSE)
![SAP](https://img.shields.io/badge/SAP-000000?style=flat&logo=sap&logoColor=white)
![ABAP](https://img.shields.io/badge/ABAP-0A9EDC?style=flat&logo=sap&logoColor=white)
![Fiori](https://img.shields.io/badge/Fiori-0A9EDC?style=flat&logo=sap&logoColor=white)
![UI5](https://img.shields.io/badge/UI5-0A9EDC?style=flat&logo=sap&logoColor=white)
![SAP BTP](https://img.shields.io/badge/SAP%20BTP-0A9EDC?style=flat&logo=sap&logoColor=white)
![SAP RAP](https://img.shields.io/badge/SAP%20RAP-0A9EDC?style=flat&logo=sap&logoColor=white)

## ABAP RAP - Exemplo de implementação
### O que é ABAP RAP?
O ABAP RAP (Rapid Application Programming) é um modelo de programação que permite o desenvolvimento ágil de aplicações no SAP S/4HANA. Ele combina a flexibilidade do ABAP com as melhores práticas de desenvolvimento moderno, como a utilização de serviços OData e a separação entre lógica de negócios e interface do usuário.

### Exemplo de implementação de um serviço OData utilizando o ABAP RAP (Rapid Application Programming) no SAP S/4HANA.
O exemplo consiste em um serviço OData que permite a criação, leitura, atualização e exclusão de dados de um objeto de negócios (Business Object) chamado "Produto".
```mermaid
flowchart TD
    A(SAP Cloud Platform, ABAP Environment<br>SAP S/4HANA ≥ 1909) --> B(ABAP RESTful Application<br>Programming Model)
    B --> C(Business Service)
    B --> D(Core Data Services)
    B --> E(Behavior Definition & Implementation)
```
### Estrutura do projeto

Uma estrutura típica de projeto ABAP RAP pode incluir os seguintes componentes:
```mermaid
flowchart TD
    subgraph ServiceConsumption[<b>Service consumption</b>]
        direction TB
        A1(SAP Fiori UX<br>Consume OData UI services):::greenBox
        A2(Web API<br>Consume OData Web APIs):::greenBox
    end

    subgraph BusinessServicesProvisioning[<b>Business services provisioning</b>]
        direction TB
        B1(Service binding<br>Bind to protocol version and scenario):::blueBox
        B2(Service definition<br>Define scope to be exposed):::blueBox
        B3(Business object projection<br>CDS: Projection views<br>BDEF: Behavior projection<br>ABAP: Behavior implementation):::blueBox
    end

    subgraph DataModelingAndBehavior[<b>Data modeling and behavior</b>]
        direction TB
        C1(Business objects<br>CDS: Data modeling<br>BDEF: Behavior definition<br>ABAP: Behavior implementation):::orangeBox
        C2(Queries<br>CDS: Data modeling):::orangeBox
    end

    ServiceConsumption --> BusinessServicesProvisioning
    BusinessServicesProvisioning --> DataModelingAndBehavior

    classDef greenBox fill:#d9f7be,stroke:#52c41a,stroke-width:2,color:#000;
    classDef blueBox fill:#e6f7ff,stroke:#1890ff,stroke-width:2,color:#000;
    classDef orangeBox fill:#fff7e6,stroke:#fa8c16,stroke-width:2,color:#000;
```

### Steps for RESTful ABAP Programming Model

Below are the typical steps for implementing the RESTful ABAP Programming Model:

1. Create a table.
2. Create an interface view that reads from this table.
3. Create a consumption view that reads from this interface view.
4. Create a metadata extension file.
5. Define entities for Business Object.
6. Define behavior definitions.
7. Implement behavior definitions.
8. Define behavior projections.
9. Define service definition.
10. Define service binding.
11. Optionally – Add draft handling feature.

"Se vi mais longe, foi por estar sobre os ombros de gigantes"
