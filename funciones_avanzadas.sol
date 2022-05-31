// SPDX-License-Identifier: MIT

// Version del compilador
pragma solidity ^0.8.0;


//Smart Contract funciones avanzadas
contract Drink{
        //Estructura de Datos
        struct recipe{
            string name;
            string ingredients;
        }

        //Recetas
        recipe [] recipes;

        //Función para crear una nueva receta
        function newRecipe(string memory _name, string memory _ingredients) internal {
            recipes.push(recipe(_name,_ingredients));
        }
}

//Vamos a llamar la función del smart contract Drink haciendo una herencia ->
contract Cocktail is Drink{
    //Dirección publica del owner
    address public owner;

    //Constructor
    constructor (){
        owner = msg.sender;
    }

    //Hacemos un cocktail con el smart contract de bebidas "Drink"
    function doCocktail(string memory _ingredients, uint256 _uints) external{
        //Ponemos una restriccion para pedir hamb.
        require(_uints<=5, "No puedes pedir mas de 5");
        newRecipe("Cocktail",_ingredients);
    }

    //Función restrictiva para el owner del smart contract
    function hashPrivateNumber(uint256 _number) public view onlyOwner returns (bytes32){
        return keccak256(abi.encodePacked(_number));
    }

    //Modificador que solo permite el acceso al owner del smart contract
    modifier onlyOwner(){
        require(owner==msg.sender, "Solo el propietario lo puede hacer");
        _;
    }
