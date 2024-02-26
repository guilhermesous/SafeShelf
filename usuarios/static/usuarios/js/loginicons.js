function mostrarSenha(){
    var inputPass = document.getElementById('id_password');
    var btnShowPass = document.getElementById('btnsenha')
    if (inputPass.type === 'password'){
        inputPass.setAttribute('type', 'text')
        btnShowPass.setAttribute('src', '../../static/usuarios/imagens/icons8-invisível-100.png')
    }else{
        inputPass.setAttribute('type', 'password')
        btnShowPass.setAttribute('src', '../../static/usuarios/imagens/icons8-visível-100.png')
    }
}

var inputarea3 = document.getElementById('id_username');
inputarea3.insertAdjacentHTML('afterend', '<img class="formicons" oncontextmenu="return false;" src="../../static/usuarios/imagens/icons8-convidado-masculino-100.png" alt="">');

var inputarea = document.getElementById('id_password');
inputarea.insertAdjacentHTML('afterend', '<img class="formicons iconsenha" id="btnsenha"  src="../../static/usuarios/imagens/icons8-visível-100.png" onclick="mostrarSenha()" alt="">');
