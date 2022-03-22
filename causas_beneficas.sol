pragma solidity 0.8.0;

contract beneficas {
    
    struct causa {
        uint id;
        string nombre;
        uint cantidadRecaudada;
        uint cantidadObjetivo;
    }

    mapping (string=>causa) causas;
    uint numeroCausa=0;
    function agregarCausa(string memory _n, uint _objetivo) public payable {
        numeroCausa++;
        causas[_n]=causa(numeroCausa,_n,0,_objetivo);
    }
    function objetivoCumplido(string memory _n) private view returns (bool ){
        bool objetivoc=false;
        if (causas[_n].cantidadRecaudada>=causas[_n].cantidadObjetivo) {
            objetivoc=true;
            return objetivoc;
        } else {
            return objetivoc;
        }
    }

    function donar (string memory _n,uint _dinero) public returns(bool){
        if (objetivoCumplido(_n)) {
            return false;
        } else {
            causas[_n].cantidadRecaudada=causas[_n].cantidadRecaudada+_dinero;
        }
    }

    function comprobarObjetivo(string memory _n) public view returns ( string memory) {
        if (causas[_n].cantidadRecaudada>=causas[_n].cantidadObjetivo) {
            return "La causa ya completo su objetivo";
        } else {
            return "La causa todavia esta abierta";
        }
    }
}