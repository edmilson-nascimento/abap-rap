CLASS zcl_uxteam_texts DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  " Esta classe já existe como parte do seu RAP

  " Os text symbols serão definidos aqui
  "&SALES_ORDER = Pedido de Venda
  " &SALES_ORDER_ID = Número do Pedido
  " ...

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_uxteam_texts IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( TEXT-001 ).
  ENDMETHOD.

ENDCLASS.
