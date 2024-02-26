function mostrarSenha(){
    var inputPass = document.getElementById('id_password1');
    var btnShowPass = document.getElementById('btnsenha')
    var inputPass2 = document.getElementById('id_password2');
    var btnShowPass2 = document.getElementById('btnsenha2')
    if (inputPass.type === 'password'){
        inputPass.setAttribute('type', 'text')
        btnShowPass.setAttribute('src', '../../static/usuarios/imagens/icons8-invisível-100.png')
    }else{
        inputPass.setAttribute('type', 'password')
        btnShowPass.setAttribute('src', '../../static/usuarios/imagens/icons8-visível-100.png')
    }
    if (inputPass2.type === 'password'){
        inputPass2.setAttribute('type', 'text')
        btnShowPass2.setAttribute('src', '../../static/usuarios/imagens/icons8-invisível-100.png')
    }else{
        inputPass2.setAttribute('type', 'password')
        btnShowPass2.setAttribute('src', '../../static/usuarios/imagens/icons8-visível-100.png')
    }
}

var inputarea = document.getElementById('id_password1');
inputarea.insertAdjacentHTML('afterend', '<img class="formicons iconsenha" id="btnsenha"  src="../../static/usuarios/imagens/icons8-visível-100.png" onclick="mostrarSenha()" alt="">');

var inputarea2 = document.getElementById('id_password2');
inputarea2.insertAdjacentHTML('afterend', '<img class="formicons iconsenha" id="btnsenha2"  src="../../static/usuarios/imagens/icons8-visível-100.png" onclick="mostrarSenha()" alt="">');

var inputarea3 = document.getElementById('id_username');
inputarea3.insertAdjacentHTML('afterend', '<img class="formicons" oncontextmenu="return false;" src="../../static/usuarios/imagens/icons8-convidado-masculino-100.png" alt="">');

var inputarea4 = document.getElementById('id_email');
inputarea4.insertAdjacentHTML('afterend', '<img class="formicons" oncontextmenu="return false;" src="../../static/usuarios/imagens/icons8-e-mail-100.png" alt="">');
