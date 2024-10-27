#!/bin/bash

echo "Ingrese el nombre del nuevo usuario: "
read usuario

# Verificar si el usuario ya existe
if id "$usuario" &>/dev/null; then
    echo "El usuario '$usuario' ya existe."
    echo "¿Deseas modificarlo? (s/n)"
    read respuesta

    if [ "$respuesta" == "s" ] || [ "$respuesta" == "S" ]; then
        echo "Modificando el usuario '$usuario'."
        # Aquí puedes agregar los comandos para modificar el usuario
        # Por ejemplo, cambiar la contraseña o los permisos
        sudo passwd "$usuario"
        echo "Usuario '$usuario' modificado con éxito."
    else
        echo "No se realizaron cambios."
    fi
else
    sudo adduser "$usuario"
    echo "Usuario '$usuario' creado con éxito."
fi