<?php
include "conexao.php";

$sql = "SELECT * FROM tb_usuarios";

$consultar = $pdo->prepare($sql);

try{
    $consultar->execute();
    $resultados = $consultar->fetchAll(PDO::FETCH_ASSOC);
    echo "<option value='' disabled selected>Selecione</option>";
    foreach($resultados as $item){
        $id_usuario = $item['id_usuario'];
        $nome_usuario = $item['nome_usuario'];
        echo "<option value='$id_usuario'>$nome_usuario</option>";
    }
}catch(PDOException $erro){
    echo "Falha ao consultar.".$erro->getMessage();
}

?>