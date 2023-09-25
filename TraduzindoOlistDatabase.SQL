/*
Altere o RMxxxx para o seu RM e execute no Oracle SQL Developer
*/

ALTER TABLE CUSTOMERS_RMxxxx rename column "CUSTOMER_ID" to cliente_id;
ALTER TABLE CUSTOMERS_RMxxxx rename column "CUSTOMER_UNIQUE_ID"  to cliente_unico_id;
ALTER TABLE CUSTOMERS_RMxxxx rename column "CUSTOMER_ZIP_CODE_PREFIX"   to cliente_cep;
ALTER TABLE CUSTOMERS_RMxxxx rename column "CUSTOMER_CITY"     to cliente_cidade;
ALTER TABLE CUSTOMERS_RMxxxx rename column "CUSTOMER_STATE"  to cliente_estado;

ALTER TABLE ORDER_ITENS_RMxxxx rename column "ORDER_ID" to pedido_id;
ALTER TABLE ORDER_ITENS_RMxxxx rename column "ORDER_ITEM_ID" to item_pedido_id;  
ALTER TABLE ORDER_ITENS_RMxxxx rename column "PRODUCT_ID" to produto_id;
ALTER TABLE ORDER_ITENS_RMxxxx rename column "SELLER_ID" to vendedor_id;
ALTER TABLE ORDER_ITENS_RMxxxx rename column "SHIPPING_LIMIT_DATE" to data_limite_envio; 
ALTER TABLE ORDER_ITENS_RMxxxx rename column "PRICE" to preco;
ALTER TABLE ORDER_ITENS_RMxxxx rename column "FREIGHT_VALUE" to valor_frete;

ALTER TABLE ORDER_PAYMENTS_RMxxxx rename column "ORDER_ID" to pedido_id;
ALTER TABLE ORDER_PAYMENTS_RMxxxx rename column "PAYMENT_SEQUENCIAL" to pagamento_id;
ALTER TABLE ORDER_PAYMENTS_RMxxxx rename column "PAYMENT_TYPE" to pagamento_tipo;
ALTER TABLE ORDER_PAYMENTS_RMxxxx rename column "PAYMENT_INSTALLMENTS" to parcelas;
ALTER TABLE ORDER_PAYMENTS_RMxxxx rename column "PAYMENT_VALUES" to valor;

ALTER TABLE ORDER_REVIEWS_RMxxxx rename column "REVIEW_ID" to avaliacao_id;
ALTER TABLE ORDER_REVIEWS_RMxxxx rename column "ORDER_ID" to pedido_id;
ALTER TABLE ORDER_REVIEWS_RMxxxx rename column "REVIEW_SCORE" to pontuacao;   
ALTER TABLE ORDER_REVIEWS_RMxxxx rename column "REVIEW_COMMENT_TITLE" to titulo;
ALTER TABLE ORDER_REVIEWS_RMxxxx rename column "REVIEW_COMMENT_MESSAGE" to mensagem;
ALTER TABLE ORDER_REVIEWS_RMxxxx rename column "REVIEW_CREATION_DATE" to data_cadastro;        
ALTER TABLE ORDER_REVIEWS_RMxxxx rename column "REVIEW_ANSWER_TIMESTAMP" to data_resposta;      

ALTER TABLE ORDERS_RMxxxx rename column "ORDER_ID" to pedido_id;
ALTER TABLE ORDERS_RMxxxx rename column "CUSTOMER_ID" to cliente_id;
ALTER TABLE ORDERS_RMxxxx rename column "ORDER_STATUS" to status;
ALTER TABLE ORDERS_RMxxxx rename column "ORDER_PURCHASE_TIMESTAMP" to data_pedido;
ALTER TABLE ORDERS_RMxxxx rename column "ORDER_APPROVED_AT" to data_aprovacao;
ALTER TABLE ORDERS_RMxxxx rename column "ORDER_DELIVERED_CARRIER_DATE" to data_transportadora;
ALTER TABLE ORDERS_RMxxxx rename column "ORDER_DELIVERED_CUSTOMER_DATE" to data_entrega;
ALTER TABLE ORDERS_RMxxxx rename column "ORDER_ESTIMATED_DELIVERY_DATE" to data_entrega_previsao;
 
ALTER TABLE PRODUCT_CATEGORIES_RMxxxx rename column "PRODUCT_CATEGORY_NAME" to categoria;
ALTER TABLE PRODUCT_CATEGORIES_RMxxxx rename column "PRODUCT_CATEGORY_NAME_ENGLISH" to categoria_ingles;

ALTER TABLE PRODUCT_RMxxxx rename column "PRODUCT_ID" to produto_id;
ALTER TABLE PRODUCT_RMxxxx rename column "PRODUCT_CATEGORY_NAME" to categoria;
ALTER TABLE PRODUCT_RMxxxx rename column "PRODUCT_NAME_LENGHT" to tamanho_nome_produto;
ALTER TABLE PRODUCT_RMxxxx rename column "PRODUCT_DESCRIPTION_LENGHT" to tamanho_descricao_produto;
ALTER TABLE PRODUCT_RMxxxx rename column "PRODUCT_PHOTOS_QTY" to qtde_fotos;
ALTER TABLE PRODUCT_RMxxxx rename column "PRODUCT_WEIGHT_G" to peso_gramas;
ALTER TABLE PRODUCT_RMxxxx rename column "PRODUCT_LENGTH_CM" to comprimento_cm;
ALTER TABLE PRODUCT_RMxxxx rename column "PRODUCT_HEIGHT_CM" to altura_cm;
ALTER TABLE PRODUCT_RMxxxx rename column "PRODUCT_WIDTH_CM" to largura_cm;

ALTER TABLE SELLERS_RMxxxx rename column "SELLER_ID" to vendedor_id;
ALTER TABLE SELLERS_RMxxxx rename column "SELLER_ZIP_CODE_PREFIX" to vendedor_cep;
ALTER TABLE SELLERS_RMxxxx rename column "SELLER_CITY" to cidade;
ALTER TABLE SELLERS_RMxxxx rename column "SELLER_STATE" to cidade_sp;

ALTER TABLE CUSTOMERS_RMxxxx RENAME TO CLIENTES_RMxxxx;
ALTER TABLE ORDER_ITENS_RMxxxx RENAME TO PEDIDOS_ITENS_RMxxxx;
ALTER TABLE ORDER_PAYMENTS_RMxxxx RENAME TO PEDIDOS_PAGAMENTOS_RMxxxx;
ALTER TABLE ORDER_REVIEWS_RMxxxx RENAME TO PEDIDOS_AVALIACOES_RMxxxx;
ALTER TABLE ORDERS_RMxxxx RENAME TO PEDIDOS_RMxxxx;
ALTER TABLE PRODUCT_CATEGORIES_RMxxxx RENAME TO PRODUTOS_CATEGORIAS_RMxxxx;
ALTER TABLE PRODUCT_RMxxxx RENAME TO PRODUTOS_RMxxxx;
ALTER TABLE SELLERS_RMxxxx RENAME TO VENDEDORES_RMxxxx;
