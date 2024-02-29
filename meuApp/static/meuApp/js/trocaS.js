function mostrarSenha(){
    var inputPass = document.getElementById('id_old_password');
    var btnShowPass = document.getElementById('btnsenha')
    var inputPass2 = document.getElementById('id_new_password1');
    var btnShowPass2 = document.getElementById('btnsenha2')
    var inputPass3 = document.getElementById('id_new_password2');
    var btnShowPass3 = document.getElementById('btnsenha3')
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
    if (inputPass3.type === 'password'){
        inputPass3.setAttribute('type', 'text')
        btnShowPass3.setAttribute('src', '../../static/usuarios/imagens/icons8-invisível-100.png')
    }else{
        inputPass3.setAttribute('type', 'password')
        btnShowPass3.setAttribute('src', '../../static/usuarios/imagens/icons8-visível-100.png')
    }
}

var inputarea = document.getElementById('id_old_password');
inputarea.insertAdjacentHTML('afterend', '<img class="formicons" id="btnsenha"  src="../../static/usuarios/imagens/icons8-visível-100.png" onclick="mostrarSenha()" alt="">');

var inputarea2 = document.getElementById('id_new_password1');
inputarea2.insertAdjacentHTML('afterend', '<img class="formicons" id="btnsenha2"  src="../../static/usuarios/imagens/icons8-visível-100.png" onclick="mostrarSenha()" alt="">');

var inputarea3 = document.getElementById('id_new_password2');
inputarea3.insertAdjacentHTML('afterend', '<img class="formicons" id="btnsenha3"  src="../../static/usuarios/imagens/icons8-visível-100.png" onclick="mostrarSenha()" alt="">');



