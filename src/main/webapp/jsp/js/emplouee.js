function sub() {
    var username = $("#inputUsername3").val();
    var password = $("#inputPassword3").val();
    if (username=='' ||password==''){
        alert("请输入用户名和密码");
        return;
    }
    $.ajax({
        type:'post',
        url:'/login',
        data:{"username":username,"password":password},
        datatype:'json',
        success:function (data) {
            if(data.success){
                window.location.href="index";
            }else {
                alert("登录失败！！")
            }
        },
        error:function (data) {
            alert("error????");
        }
    })
}

function resign() {

    $.ajax({
        type:'post',
        datatype:'json',
        url:'/add',
        data: {"sex":$('input:radio:checked').val(),"dno":$("#dno").val(),"ename":$("#ename").val(),"birthday":$("#birthday").val(),"username":$("#username").val(),"password":$("#password").val()},
        success: function (data) {
            if (data.success){
                alert(data.error);
                window.location.href='login.jsp';
            } else {
                alert(data.error);
            }
        }
    })
}

function toAdd() {
    // var para = $("#form").serialize();
    // alert(data);
    // $("#joindate").valueAsDate=new Date();
    var username = $("#username").val();
    var password = $("#password").val();
    var birthday = $("#birthday").val();
    var ename = $("#ename").val();
    var dno = $("#dno").val();

    if (username==''||password==''||birthday==''||ename==''||dno==''){
        alert("请填写表信息！！");
        return;
    }
    $.ajax({
        type: 'post',
        url: '/login',
        datatype:'json',
        data: {"username":username,"password":password},
        success: function (data) {
            if (data.success){
                alert("该账户已被注册，请重新注册！");
            } else {
                resign();
            }
        },
        error: function () {
            alert("系统异常，请联系管理员！");
        }
    })
}

function deleteEmpl(eid) {
    $.ajax({
        type:'post',
        datatype:'json',
        data:{"eid":eid},
        url:'/delete',
        success: function (data) {
            if (data.success){
                alert(data.error);
            } else {
                alert(data.error);
            }

        },
        error:function () {
            alert("系统错误！！");

        }
    })

}