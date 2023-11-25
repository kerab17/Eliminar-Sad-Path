@insertar 
Feature: Crear un nuevo producto usando como fuente un archivo CSV
	Background:
    * url 'http://localhost:8081'
    * def ruta_crear = '/api/v1/product/'
	Scenario Outline: Crear un producto de forma exitosa, path, response usando examples
    Given path ruta_crear,"/"
    And request { name: <name>, description: <description>, price: <price> }
    And header Accept = 'application/json'
    When method post
    Then status 201
    And match responseType == 'json'
    And match $ == {"sku":'#notnull',"status":true,"message":"El producto fue creado con éxito!"} 
	Examples:
	| read("productos.csv")   |