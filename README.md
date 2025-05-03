# ABAP Restful Application Programming Model (RAP) 

"Se nada der certo hoje, amanhã eu acordo mais cedo e tento novamente. Até eu conseguir"

---

Este repositório é baseado na lista de reprodução do YouTube [RESTful ABAP Programming Model](https://www.youtube.com/playlist?list=PLKSPsENL3CxzRehaCAyH_K0yHM8KwLrDz).  
Para fins de crédito ao autor, este repositório é uma versão em português do conteúdo apresentado na playlist.  
Se você deseja acessar o conteúdo original, visite o canal do autor no YouTube.

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

### End-to-End Example

Below are the detailed steps for implementing an end-to-end example in the RESTful ABAP Programming Model:

Segue os passos para implementar um exemplo de serviço OData utilizando o ABAP RAP (Rapid Application Programming) no SAP S/4HANA.

0. **Create a package** com nome `ZRAP_EJ`.

1. **Create a table** com nome `ZRAP_UXTEAM_EJ` with the following fields:
   - `id`
   - `firstName`
   - `lastName`
   - `age`
   - `role`
   - `salary`
   - `active`

   ![Create Table Wizard](img/1.%20Create%20a%20table.png)

```SQL
@EndUserText.label : 'UX demo table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #ALLOWED
define table zrap_uxteam_ej {

  key client            : abap.clnt not null;
  key id                : sysuuid_x16 not null;
  firstname             : abap.char(100);
  lastname              : abap.char(100);
  age                   : abap.numc(4);
  role                  : abap.char(100);
  salary                : abap.numc(4);
  active                : abap_boolean;
  last_changed_at       : timestampl;
  local_last_changed_at : timestampl;

}
```

2. **Create an interface view** named `ZI_UXTEAM_EJ` that reads from table `ZRAP_UXTEAM_EJ`.

 ![Create an interface view](img/2%20Create%20an%20interface%20view.png)

 ![Create an interface view](img/2%20Create%20an%20interface%20view%20(template).png.png)

Neste exemplo, o código da view é o seguinte:
```sql
@AbapCatalog.sqlViewName: 'ZZI_UXTEAM_EJ'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for UX demo'
// @Metadata.ignorePropagatedAnnotations: true
define view zi_uxteam_ej
  as select from zrap_uxteam_ej
{
  key id                    as Id,
      firstname             as Firstname,
      lastname              as Lastname,
      age                   as Age,
      role                  as Role,
      salary                as Salary,
      active                as Active,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt
}
```
Todos os campos da tabela sao adicionados na view, exceto os campos `client`, `last_changed_at` e `local_last_changed_at`, que são gerenciados pelo sistema.

Foi adicionar um **ZZ** no nome da view para evitar conflitos com views padrão do sistema.
```sql
@AbapCatalog.sqlViewName: 'ZZI_UXTEAM_EJ'
```

Notas:
```abap
@Semantics.systemDateTime.lastChangedAt: true
last_changed_at       as LastChangedAt,

@Semantics.systemDateTime.localInstanceLastChangedAt: true
local_last_changed_at as LocalLastChangedAt
```
Essas anotações são usadas pelo RAP para controle **automático de versionamento e atualização**.

`last_changed_at`: Momento da última modificação feita em qualquer instância (usado para lock otimista, etc.).

`local_last_changed_at`: Similar, mas referente à instância local (em contextos de objetos compostos).



3. **Create a consumption view** named `ZC_UXTEAM` that reads from interface view `ZI_UXTEAM`.

4. **Create a metadata extension file** for UI annotations.

5. **Define entities for Business Object**:
   - `CREATE`, `UPDATE`, `DELETE` operations.
   - Validations during `CREATE` – Age should be greater than 21.
   - Actions – Active flag is set to true after a series of checks are complete.
   - Determination – When `Role` is changed, we change the `Salary`.
   - Feature control – `Salary` is marked read-only.

6. **Define Behavior Definitions**:
   - Note that `CUD` operations are **FREE**.

7. **Implement Behavior Definitions**.

8. **Define Behavior Projections**:
   - Project all behaviors except `DELETE`.

9. **Define Service Definition**.

10. **Define Service Binding**:
    - `OData V2` with UI annotations.
    - `OData V2` without Fiori element app.

11. **Add draft handling functionality**.

"Se nada der
certo hoje,
amanhã eu
acordo mais
cedo e tento
novamente.
Até eu conseguir"
