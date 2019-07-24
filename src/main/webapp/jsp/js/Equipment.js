function addCart(equipId) {
    var tag = "#borrownum"+equipId;
    // var borrowNum = $("#borrownum").val();
    var borrowNum = $(tag).val();

    var Reg = /^[0-9]*$/;
    if (!Reg.test(borrowNum)){
        alert("请输入正确的数量！")
        return ;
    }
    if (confirm('确认申请'+borrowNum+'件吗?')) {
        $.ajax({
            type:"post",
            datatype:"json",
            url:'addGoodsInCart',
            data:{"id":equipId,"number":borrowNum},
            success:function (data) {
                // window.location.href=""
                alert("申请成功！")
            }

        })
    }
}

function editEqui(id) {
    if (id==''){
        alert("参数错误！！！");
        return;
    }
    $.ajax({
        type:"post",
        datatype:"json",
        url:'queryById',
        data:{"id":id},
        success:function (data) {
            window.location.href="jsp/pages/EquiEdit.jsp";
            // window.location.href="jsp/Equipment/editEqui.jsp";
            // window.location.href="#modal-container-655684";
        }

    })
}


function addEqui() {

    var equiName = $("#equiName").val();
    var twoUse = $("#twoUse").val();
    var endDate = $("#endDate").val();
    var equiClass = $("#equiClass").val();
    var equiCompany = $("#equiCompany").val();
    var equiNum = $("#equiNum").val();
    var remark = $("#remark").val();
    // alert(endDate instanceof Date);

    if (equiName==''||equiCompany==''||twoUse==''||endDate==''||equiClass==''||equiName==''){
        alert("参数不能为空！！");
        return;
    }

    $.ajax({
        type: "post",
        datatype: "json",
        url: 'insertEqui',
        data: {
            "equiName": equiName,
            "twoUse": twoUse,
            "endDate": endDate,
            "equiClass": equiClass,
            "equiCompany": equiCompany,
            "equiNum": equiNum,
            "remark": remark
        },
        success: function (data) {
            window.location.href = "/equipList?currPage=1";
        },
        error: function (data) {
            alert("error occured");
        }

    })
}

function backEquip(id,equipId,equipNum) {
    if (id==''||equipNum==''||equipId==''){
        alert("参数错误！！请联系管理员。");
        return;
    }

    var btn = "#buttonSelect"+id;
    $.ajax({
        type:'post',
        datatype:'json',
        data:{"id":id,"equipId":equipId,"equipNum":equipNum},
        url:'/backEquip',
        success:function (data) {
            if (data.success){
                alert(data.data);
                $(btn).attr("disabled",true);
            } else {
                alert(data.data);
            }
        },
        error:function (data) {
          alert("系统异常，请联系管理员！！");
        }
    })
}